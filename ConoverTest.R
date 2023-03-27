# Dr Magdalena Fraszczak, QBA LIU 2023 -------------------------------------------------------------------------------------------------------------------------------

ConoverSNP <- function(file_in, file_out){
  library(PMCMRplus)
  library(data.table)
  library(rcompanion)
  genes_matrix <- as.matrix(read.table(file_in), sep=" ")
  genes_matrix[,1] = sub(" ", "", genes_matrix[,1])
  unique_genes = unique(genes_matrix[,3])
  final_matrix = matrix(-9, nrow = as.numeric(genes_matrix[1,2]), length(unique_genes))
  for(i in 1:length(unique_genes)){
    for(j in 1:genes_matrix[1,2]){
      final_matrix[j,i] = length(which(subset(genes_matrix, genes_matrix[ ,3] == unique_genes[i])[ ,1] == j))}}
  colnames(final_matrix) = unique_genes
  final_matrix_transposed = t(final_matrix)
  results = frdAllPairsConoverTest(y = as.numeric(final_matrix_transposed), groups = rep(c(1:ncol(final_matrix_transposed)), each = nrow(final_matrix_transposed)), blocks = rep(1:nrow(final_matrix_transposed), ncol(final_matrix_transposed)) , p.adjust.method = "bonf", alternative = 'less')
  results2 <- PMCMRTable(results, reverse = FALSE, digits = 3)
  fwrite(x = results2, file = file_out, col.names = TRUE, row.names = TRUE)
}



for (i in 2:15){

ConoverSNP(file_in = paste0("C:/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_22/INTRONS_python/INTRONS_canonical_human_chr22_genes_with_", i, "_introns.txt"), file_out = paste0("C:/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/FRIEDMAN_MATRICES/CHR22_INTRONS/Conover_chrom22_", i, "introns.txt"))

}
