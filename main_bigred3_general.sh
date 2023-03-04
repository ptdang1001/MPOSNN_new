#!/bin/bash

#SBATCH -J mposnn
#SBATCH -p general
#SBATCH -o /N/slate/pdang/myProjectsDataRes/jobOutputs/%j.out
#SBATCH -e /N/slate/pdang/myProjectsDataRes/jobOutputs/%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pdang@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --time=50:00:00
#SBATCH --mem=58G


#module load
module load python/3.9.8

#python
#/N/soft/rhel7/python/3.9.8/bin/python main_realData.py --module_source $1 --data_name $2
python src/main.py --geneExpression_file_name $1 --compounds_modules_file_name $2 --modules_genes_file_name $3 --module_source $4

