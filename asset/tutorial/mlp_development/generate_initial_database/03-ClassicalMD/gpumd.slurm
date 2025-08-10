#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1          # Nodes * GPUs-per-node * Ranks-per-GPU
#SBATCH --gpus-per-node=1  # Specify the GPUs-per-node
#SBATCH --qos=normal          # Depending on your needs [Priority: 4gpu (default) > 8gpu > normal > huge]
#SBATCH -p  WS-ALL

nvidia-smi dmon -s pucvmte -o T > nvdmon_job-$SLURM_JOB_ID.log &
module load cuda/12.4.1 
export PATH=/home/liushiLab/lidenan/soft/GPUMD/GPUMD/src/:$PATH

gpumd 

# Must explicitly exit
exit
