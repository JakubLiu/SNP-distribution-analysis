# Dr.Magdalena Fraszczak, QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------
genes_matrix_maker <- function(file_in, file_out){
    library(data.table)
    genes_matrix <- as.matrix(read.table(file_in), sep=" ")
    genes_matrix[,1] = sub(" ", "", genes_matrix[,1])
    unique_genes = unique(genes_matrix[,3])
    final_matrix = matrix(-9, nrow = as.numeric(genes_matrix[1,2]), length(unique_genes))
    for(i in 1:length(unique_genes)){
      for(j in 1:genes_matrix[1,2]){
        final_matrix[j,i] = length(which(subset(genes_matrix, genes_matrix[ ,3] == unique_genes[i])[ ,1] == j))}}
    colnames(final_matrix) = unique_genes
    final_matrix_transposed = t(final_matrix)
    write.table(final_matrix_transposed,file = file_out, row.names = TRUE, col.names = TRUE)
  }
  
  


for (i in 2:15){
  print(i)
  genes_matrix_maker(file_in = paste0("C:/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_1/INTRONS_python/INTRONS_canonical_human_chr1_genes_with_", i, "_introns.txt"), file_out = paste0("C:/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/TABELE_ZBIORCZE/CHR1_INTRONS/chr1_", i, "introns_GenesMatrix.txt"))
  
  
}
