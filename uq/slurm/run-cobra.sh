#!/bin/bash -l

## job name
#SBATCH --job-name=mfw_uq

## stdout and stderr files
#SBATCH --output=test-out.%j
#SBATCH --error=test-err.%j

## wall time in format MINUTES:SECONDS
#SBATCH --time=02:00:00

## number of nodes and tasks per node
#SBATCH --nodes=1
#SBATCH --tasks-per-node=40

## queue name
#SBATCH --partition=medium

## grant
#SBATCH --mail-user=ljala@rzg.mpg.de

export SYS=COBRA
export SCRATCH=/ptmp/ljala/
export MPICMD=srun
export LD_LIBRARY_PATH=${FFTW_HOME}/lib:${LD_LIBRARY_PATH}

# For QCG-PilotJob usage
ENCODER_MODULES="mfw.templates.cpo_encoder;mfw.templates.xml_encoder"
export ENCODER_MODULES
export EASYPJ_CONFIG=conf.sh

# Run the UQ code
python3 tests/loop_combined_pj.py > test-log.${SLURM_JOBID}
