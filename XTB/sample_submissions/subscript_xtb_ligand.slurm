#!/bin/bash --login
# ONETEP job submission script for Iridis 5 by J. C. Womack, 29/03/18
# v0.01

# uncomment the following two lines if you need to debug this script
# set -v      # Print script lines as they are read.
# set -x      # Print commands and their arguments as they are executed.

# SLURM job options 
#SBATCH --job-name xtb            # Name for job
#SBATCH --partition serial	       # Use batch resource allocation partition
#SBATCH --nodes=1                      # Number of nodes in job
#SBATCH --cpus-per-task 64              # Number of OMP threads spawned from each MPI process
#SBATCH --mem 0		               # Memory required per node, "0" is a special option which requests all the memory on each node.
#SBATCH --time 0:15:00
#SBATCH --exclusive

module load intel-mkl/2018.1.163 
module load conda
conda activate ame
export MKL_NUM_THREADS=64
export OMP_THREAD_LIMIT=64 
export OMP_NUM_THREADS=${OMP_THREAD_LIMIT},1
export OMP_STACKSIZE=500m
ulimit -s unlimited

COORD="COORDIN"
CHARGE=0

xtb ${COORD} --chrg ${CHARGE} --uhf 0 --gbsa water > ${COORD}.out
