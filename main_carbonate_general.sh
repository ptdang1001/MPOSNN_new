#!/bin/bash

#SBATCH -J sbs
#SBATCH -p general
#SBATCH -o /N/slate/pdang/myProjectsDataRes/jobOutputs/%j.out
#SBATCH -e /N/slate/pdang/myProjectsDataRes/jobOutputs/%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pdang@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --time=20:00:00
#SBATCH --mem=128G

#module load
module load python/3.9.8

#python
#python ./main_allSolu.py --module_source $1 --subgraph_id $2
python src/main.py --geneExpression_file_name $1 --compounds_modules_file_name $2 --modules_genes_file_name $3 --module_source $4
