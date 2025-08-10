#!/bin/bash
#SBATCH --job-name=vasp
#SBATCH --partition=liushi
#SBATCH --nodes=1
#SBATCH --ntasks-per-socket=8
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=64
#SBATCH --mem=489789M

module load vasp/6.4.2-zen3
export OMP_NUM_THREADS=1
mpirun -np 64 -map-by ppr:8:l3cache:pe=1 vasp_std
