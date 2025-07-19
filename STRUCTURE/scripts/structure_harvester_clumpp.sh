#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mail-type=ALL
#SBATCH --ntasks=10
#SBATCH --account=leachlj-potato-qtl-project

set -e

module purge; module load bluebear
module load bear-apps/2023a
module load Python/3.11.3-GCCcore-12.3.0

SCRIPT_DIR="/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/scripts/structureHarvester"

${SCRIPT_DIR}/structureHarvester.py --dir=/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results/ --out=/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results/bestK --clumpp

#WE NEED TO DO ADDITIONAL EDIT OF INDFILE FOR CLUMPP TO WORK IN NEXT STEPS
#HAVE JUST DONE THIS FOR K3 AS BASED ON RESULTS OF EVANNO TEST OPTIMAL K=3

cd /rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results/bestK/

cp K3.indfile clumpp_input_K3.indfile

sed -i 's/     ([0-9]*\.[0-9]*,([0-9]*\.[0-9]*,([0-9]*\.[0-9]*,//g' clumpp_input_K3.indfile
