#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mail-type=ALL
#SBATCH --ntasks=10
#SBATCH --account=leachlj-potato-qtl-project

set -e

module purge; module load bluebear
module load bear-apps/2023a

IN_DIR="/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results"
OUT_DIR="/rds/projects/l/leachlj-potato-qtl-project/JackB/GWAS_project_1/STRUCTURE/final_results/alpha_data"

# Loop through all stlog files in the directory
for file in "$IN_DIR"/*.stlog; do
    # Get the base filename without the directory
    base_name=$(basename "$file" .stlog)
    
    # Output file for the extracted table
    output_file="$OUT_DIR/${base_name}_alpha.txt"
    
    # Extract "Table 1" and save it to the output file
    awk '/Rep#/{flag=1; next} /^[[:space:]]*$/{flag=0} flag' "$file" | awk '{print $1, $2}' > "$output_file"
    
    echo "Processed $file -> $output_file"
done

