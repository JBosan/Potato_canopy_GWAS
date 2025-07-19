# Potato_canopy_GWAS
Associated code and data for GWAS analysis of potato canopy traits and yield

#### BLUEs
[BLUEs.Rmd](https://github.com/JBosan/Potato_canopy_GWAS/blob/main/BLUEs.Rmd) and [/BLUEs_output](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/BLUEs_output) provide the code used to generate the Best Linear Unbiased Estimates for phenotype
data and the output of this analysis, respectively.

#### DAPC
[DAPC.Rmd](https://github.com/JBosan/Potato_canopy_GWAS/blob/main/DAPC.Rmd) and [/DAPC_output](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/DAPC_output) provide the code used to for Discriminant Analysis of Principal Components run using [adegenet v2.1.7](https://github.com/thibautjombart/adegenet) in R and the 
output of this analysis, respectively.

#### GWASpoly
[GWAS_poly.Rmd](https://github.com/JBosan/Potato_canopy_GWAS/blob/main/GWAS_poly.Rmd) and [/GWAS_poly_.Rmd_output](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/GWAS_poly_output) provide the code used for GWAS analysis using [GWASpoly v2.13](https://github.com/jendelman/GWASpoly) and
output of this analysis, respectively.

#### SNP_BLUEs_dist
[SNP_BLUEs_dist_analysis.Rmd](https://github.com/JBosan/Potato_canopy_GWAS/blob/main/SNP_pheno_dist_analysis.Rmd) and [/SNP_BLUEs_dist](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/SNP_pheno_dist) provide the code used to visualize the distribution of trait BLUEs for significant 
SNPs across the five possible genotypes in potato and the resulting boxplots + the relevant data, respectively.

#### STRUCTURE
 - [STRUCTURE_prep.Rmd](https://github.com/JBosan/Potato_canopy_GWAS/blob/main/STRUCTURE_prep.Rmd) provides the code used to prepare data for STRUCTURE analysis.
 - [/STRUCTURE](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/STRUCTURE) provides code used to run [STRUCTURE v2.3.4](https://web.stanford.edu/group/pritchardlab/structure.html), [Structure Threader v1.3.0](https://github.com/StuntsPT/Structure_threader), [StructureHarvester v0.7](https://github.com/dentearl/structureHarvester), 
 and [CLUMPP v1.1.2](https://rosenberglab.stanford.edu/clumpp.html), along with outputs for the analysis.
 - [STRUCTURE_results.Rmd](https://github.com/JBosan/Potato_canopy_GWAS/blob/main/STRUCTURE_results.Rmd) provides the R code used to visualize the STRUCTURE results.

#### raw_data
/raw_data provides all the relevant [genotype](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/raw_data/genotype) and [phenotype](https://github.com/JBosan/Potato_canopy_GWAS/tree/main/raw_data/phenotype) data used in analysis.
