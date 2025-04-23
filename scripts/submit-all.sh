#!/bin/bash
module load slurm

for job in `ls RunMe*sh`
do 
 echo $job
 sbatch $job
 sleep 1
done

squ

exit 0

