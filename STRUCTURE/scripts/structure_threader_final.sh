#!/bin/bash
#SBATCH --time=240:00:00
#SBATCH --mail-type=ALL
#SBATCH --ntasks=200
#SBATCH --account=leachlj-potato-qtl-project

set -e

module purge; module load bluebear
module load bear-apps/2023a
module load Python/3.11.3-GCCcore-12.3.0


THREADER_DIR="/rds/homes/j/jlb801/.local/bin"
STRUCTURE_DIR="/rds/bear-apps/2022b/EL8-ice/software/Structure/2.3.4-GCC-12.2.0/bin"
IN_DIR="/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/raw_data/genotype"
OUT_DIR="/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results/"
PARAMS="/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/scripts/"

${THREADER_DIR}/structure_threader run -K 10 -R 30 -i ${IN_DIR}/filtered_STRUCTURE_final.txt -o ${OUT_DIR} --params ${PARAMS}/mainparams -st ${STRUCTURE_DIR}/structure -t 200 --log 1
