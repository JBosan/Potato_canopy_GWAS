#!/bin/bash
#SBATCH --time=240:00:00
#SBATCH --mail-type=ALL
#SBATCH --ntasks=40
#SBATCH --account=leachlj-potato-qtl-project

set -e

module purge; module load bluebear
module load bear-apps/2023a
module load Python/3.11.3-GCCcore-12.3.0

cd /rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results/bestK/

CLUMPP/CLUMPP CLUMPP/paramfile -i clumpp_input_K3.indfile -o CLUMPP/K3.outfile -j CLUMPP/K3.miscfile
