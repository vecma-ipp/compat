import os
import time
import numpy as np
import chaospy as cp
import easyvvuq as uq

from ascii_cpo import read
from easyvvuq.execution.qcgpj.pj_utils.pj_configurator import PJConfigurator
from qcg.appscheduler.api.manager import Manager
from qcg.appscheduler.api.job import Jobs
from qcg.appscheduler.api.manager import LocalManager


'''
UQ test of ETS using QCG Pilot Job.
Uncertainties in 4 flux tubes. Parameters: D1, D2, D3, D4.
Quantity of Interest: electron temperature (Te).
'''

# Environment info
# -----------------

cwd = os.getcwd()
tmp_dir = "/ptmp/ljala/"

# Machine name
SYS = os.environ['SYS']

# Set location of log file
client_conf = {'log_file': os.path.join(tmpdir, "api.log")}

print("Running in directory: " + cwd)
print("Temporary directory: " + tmpdir)

# Application info
# -----------------

# CPO files location
cpo_dir = os.path.abspath("../../data/TESTS/")

# The application executable
bin_file = "../../bin/"+SYS+"/ets_pj_run "

# Uncertain parameters
uncert_params = ["D1", "D2", "D3", "D4"]

# Input/Output template
input_json  = "inputs/ets_pj_in.json"
output_json = os.path.join(tmp_dir, "out_ets_pj.json")

assert(os.path.exists(input_json))

# Initialize Campaign object
ets_campaign = uq.Campaign(
    name='ETS_PJ_Campaign',
    state_filename=input_json,
    workdir=tmp_dir,
    default_campaign_dir_prefix='ETS_PJ_Campaign_'
)

campaign_dir = ets_campaign.campaign_dir

# Copy xml files needed in the ETS code
os.system("mkdir " + campaign_dir +"/workflows")
os.system("cp ../../workflows/ets.xml "+ campaign_dir +"/workflows")
os.system("cp ../../workflows/ets.xsd "+ campaign_dir +"/workflows")

# Copy CPO files in common directory
common_dir = campaign_dir +"/common/"
os.system("cp " + cpo_dir + "/*.cpo " + common_dir)

# Get uncertain parameters distrubutions
coret_file = common_dir + "ets_coretransp_in.cpo"
coret = read(coret_file, "coretransp")
diff_eff = coret.values[0].te_transp.diff_eff
list_dist = [cp.Normal(diff_eff[i], 0.2*diff_eff[i]) for i in range(4)]

# Define the parameters dictionary
for i in range(4):
    ets_campaign.vary_param(uncert_params[i], dist=list_dist[i])

# Create the sampler
ets_sampler  = uq.elements.sampling.PCESampler(ets_campaign)

# Generate runs
ets_campaign.add_runs(ets_sampler)

# Create PJ configurator
pjc = PJConfigurator(ets_campaign)
pjc.init_runs_dir()

# Save PJ configuration
pjc.save()

# Execute encode -> execute for each run using QCG-PJ
for key, data in ets_campaign.runs.items():

    encode_job = {
        "name": 'encode_' + key,
        "execution": {
            "exec": "./pj_scripts/easyvvuq_encode",
            "args": [ets_campaign.campaign_dir,
                     key],
            "wd": cwd,
            "stdout": ets_campaign.campaign_dir + '/encode_' + key + '.stdout',
            "stderr": ets_campaign.campaign_dir + '/encode_' + key + '.stderr'
        },
        "resources": {
            "numCores": {
                "exact": 1
            }
        }
    }

    execute_job = {
        "name": 'execute_' + key,
        "execution": {
            "exec": "./pj_scripts/easyvvuq_execute",
            "args": [ets_campaign.campaign_dir,
                     key,
                     cwd + "/pj_scripts/easyvvuq_app",
                     app, "pce_in.json"],
            "wd": cwd,
            "stdout": ets_campaign.campaign_dir + '/execute_' + key + '.stdout',
            "stderr": ets_campaign.campaign_dir + '/execute_' + key + '.stderr'
        },
        "resources": {
            "numCores": {
                "exact": 1
            }
        },
        "dependencies": {
            "after": ["encode_" + key]
        }
    }

    m.submit(Jobs().addStd(encode_job))
    m.submit(Jobs().addStd(execute_job))

# Execute runs TODO add argument
# cmd = bin_file + common_dir + " ets_pj_input.nml"

# wait for completion of all PJ tasks and terminate the PJ manager
m.wait4all()
m.finish()
m.stopManager()
m.cleanup()

# Aggregate the results from all runs.
print("Aggregating the results")
output_filename = ets_campaign.params_info['out_file']['default']
output_columns = ['te']

aggregate = uq.elements.collate.AggregateSamples(
    ets_campaign,
    output_filename=output_filename,
    output_columns=output_columns,
    header=0,
)

aggregate.apply()

print("aggregated data:")
print(open(my_campaign.data['files'][0], 'r').read())

# Analysis
print("Making the analysis")
analysis = uq.elements.analysis.PCEAnalysis(
    ets_campaign, value_cols=output_columns)

dist, cov = analysis.apply()

# Results
stats  = analysis.statistical_moments('te')
sobols = analysis.sobol_indices('te', 'first_order')

# Elapsed time
end_time = time.time()

# For plots
corep_file = common_dir + '/ets_coreprof_in.cpo'
corep = read(corep_file, 'coreprof')
rho = corep.rho_tor

#  Graphics for descriptive satatistics
plots.plot_stats(rho, stats,
                 xlabel=r'$\rho_{tor} app ~ [m]$', ylabel=r'$T_e [eV]$',
                 ftitle='Te profile',
                 fname='../plots/te_stats_pj.png')

plots.plot_sobols(rho, sobols, uncert_params,
                  ftitle=' First-Order Sobol indices - QoI: Te.',
                  fname='../plots/ti_sobols_pj.png')
