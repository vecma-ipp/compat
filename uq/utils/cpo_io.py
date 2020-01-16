import logging
from os.path import join
from ascii_cpo import read
from .statistics import get_dist


# TODO to be improved: cf. UAL module
def get_parameters(cpo_core):
    params_mapper = {}

    if cpo_core.base_path == "coreprof":
        params_mapper = {
            "Te_boundary" : cpo_core.te.boundary.value[0],
            "Ti_boundary" : cpo_core.ti.boundary.value[0][0],
            "Te" : cpo_core.te.value[:],
            "Ti" : cpo_core.ti.value[:][0],
            "Te_grad" : cpo_core.te.ddrho[:],
            "Ti_grad" : cpo_core.ti.ddrho[:][0]
        }

    return params_mapper

def set_parameters(cpo_core, param, value):
        # Boundary conditions
        if param=="Te_boundary":
            cpo_core.te.boundary.value[0] = value
        if param=="Ti_boundary":
            cpo_core.ti.boundary.value[0][0] = value
            # In case of two ions species
            if len(cpo_core.ti.boundary.value[0]) == 2:
                cpo_core.ti.boundary.value[0][1] = value

# Get the values of the correponding quqntities of interest
def qoi_values(cpo_core):
    qoi_mapper = {}

    if cpo_core.base_path == 'coreprof':
        qoi_mapper = {
            "Te": cpo_core.te.value,
            "Ti": cpo_core.ti.value[:,0],
        }

    if cpo_core.base_path == 'equilibrium':
        qoi_mapper = {
            "gm1": cpo_core.profiles_1d.gm1,
            "gm2": cpo_core.profiles_1d.gm2,
            "gm3": cpo_core.profiles_1d.gm3,
            "gm4": cpo_core.profiles_1d.gm4,
            "gm5": cpo_core.profiles_1d.gm5,
            "gm6": cpo_core.profiles_1d.gm6,
            "gm7": cpo_core.profiles_1d.gm7,
            "gm8": cpo_core.profiles_1d.gm8,
            "gm9": cpo_core.profiles_1d.gm9,
        }

    if cpo_core.base_path == 'coretransp':
        qoi_mapper = {
            "Te_transp_D": cpo_core.values[0].te_transp.diff_eff,
            "Ti_transp_D": cpo_core.values[0].ti_transp.diff_eff[0],
            "Te_transp_flux": cpo_core.values[0].te_transp.flux,
            "Ti_transp_flux": cpo_core.values[0].ti_transp.flux[:,0]
        }

    return qoi_mapper

def get_cponame(filename):
    # List of cpo names used in ITM
    l = ['coreprof', 'coresource', 'coretransp', 'equilibrium',
         'coretransp', 'coreimpur', 'toroidfield', 'coreneutrals']

    cponame = None
    for name in l:
        if name in filename:
            cponame = name
            break

    if cponame is None:
        msg = ("CPO filename " +filename+ " must contain cponame.")
        logging.error(msg)
        raise RuntimeError(msg)
    else:
        return cponame

# Returns dict for Campaign object and distribitions list for the Sampler
def get_inputs(dirname, filename, config_dict,
               params={}, vary={}):
    # dirname: location of xml file
    # filename: cpo file name
    # config_dict: containg uncertrain params

    cpo_file = join(dirname, filename)
    cpo_core = read(cpo_file, cpo_name)

    mapper = get_parameters(cpo_core)
    params = {}
    vary = {}

    for k, d in config_dict.items():
        # Get initial values
        val = mapper[k]
        typ = d["type"]

        # Build the probability distribution
        dist_name = d["distribution"]
        margin_error = d["margin_error"]
        dist = get_dist(dist_name, val, margin_error=margin_error)

        # Update output dict
        params.update({k: {"type": typ, "default": val}})
        vary.update({k: dist})

    return params, vary
