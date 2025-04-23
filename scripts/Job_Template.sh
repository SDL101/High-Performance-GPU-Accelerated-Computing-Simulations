#!/bin/bash 
#SBATCH -p dgx2,dgxh
#SBATCH --gres=gpu:1 
#SBATCH -t 47:59:59

module load mumax
module load cuda

cd DIRECTORY
mumax3 FILENAME
