#!/bin/bash
#SBATCH --job-name=abacus
#SBATCH --partition=liushi
#SBATCH --nodes=1               # Should be defined manually
#SBATCH --cpus-per-task=8       # Should be defined manually. Equal to $OMP_NUM_THREADS
#SBATCH --ntasks-per-node=8     # Should be defined manually
#SBATCH --mem=489789M
#SBATCH --qos=huge

module load abacus/3.7.5-zen3
readonly NUMA_CORE=8

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

mpirun -np $SLURM_NTASKS -map-by ppr:$((NUMA_CORE/OMP_NUM_THREADS)):numa:pe=$OMP_NUM_THREADS abacus
