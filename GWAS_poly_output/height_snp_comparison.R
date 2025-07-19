

sharma_2018_height_snps <- read.csv(file = "GWAS_poly_PIC_output/sharma_2018_height_snps.csv")

unique_height_snps <- unique(na.omit(sharma_2018_height_snps$Marker))

thresholds <- GWAS_k_method_bonferroni@threshold %>%
  as.data.frame() %>%
  rownames_to_column(var = "trait") %>%
  filter(trait == "Max_Max_height_m") %>%
  column_to_rownames(var = "trait")

scores_df <- GWAS_k_method_bonferroni@scores[["Max_Max_height_m"]] %>%
  rownames_to_column(var = "SNP") %>%
  filter(SNP %in% unique_height_snps)

scores_df <- scores_df %>%
  mutate(additive_threshold = rep(thresholds$additive, length(unique_height_snps)),
         .after = additive)

#define parameters for loop
height_traits <- c("Max_Max_height_m", 
                   "Max_Ave_height_m")

gwas_methods <- list(GWAS_k_method_bonferroni = GWAS_k_method_bonferroni,
                     GWAS_k_method_m.eff = GWAS_k_method_m.eff)

models <- c("additive",
            "1-dom-alt",
            "1-dom-ref",
            "2-dom-alt",
            "2-dom_ref")

#initialize list to store results
results <- list()

#loop throught traits and gwas methods
for(trait in height_traits) {
  for(gwas_name in names(gwas_methods)){
    
    gwas_method <- gwas_methods[[gwas_name]] #set current gwas method
    
    #extract thresholds for current trait
    thresholds <- gwas_method@threshold %>%
      as.data.frame() %>%
      rownames_to_column(var = "trait") %>%
      filter(trait == !!trait) %>%
      column_to_rownames(var = "trait")
    
    #extract scores for current trait
    scores_df <- gwas_method@scores[[trait]] %>%
      rownames_to_column(var = "SNP") %>%
      filter(SNP %in% unique_height_snps)
    
    #create initial summary table for current trait
    trait_data <- scores_df %>%
      select(SNP) %>%
      mutate(trait = trait,
             gwas_method = gwas_name)
    
    #add model scores and thresholds
    for (model in models) {
      if (model %in% colnames(scores_df) && model %in% colnames(thresholds)) {
        trait_data <- trait_data %>%
          mutate(!!paste0("log10_", model) := scores_df[[model]],
                 !!paste0("threshold_", model) := thresholds[[model]])
      }
    }
    
    #add results to list
    results[[paste(trait, gwas_name, sep = "_")]] <- trait_data
  }
}

names(results) <- names(results) %>%
  str_replace("Max_Max_height_m", "Max_height") %>%
  str_replace("Max_Ave_height_m", "Mean_height") %>%
  str_replace("_GWAS", "") %>%
  str_replace("_method", "")

writexl::write_xlsx(results, path = "GWAS_poly_PIC_output/height_comparison_snps.xlsx")
