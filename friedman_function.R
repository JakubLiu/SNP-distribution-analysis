#QBA LIU 2023 ------------------------------------------------------------------------------------------------------------------------------------------------------



# if manual_choose = TRUE then you can choose the file from the pop up menu
# if manual_choose = FLASE then you have to specify the input file path (file_in)



f_matrix <- function(manual_choose = TRUE, file_in = 'something'){
  
  library(PMCMRplus)
  library(base)
  
  if (manual_choose == TRUE) {
    
    chosen_file <- file.choose()
    genes_matrix <- as.matrix(read.table(chosen_file, sep=" "))
    genes_matrix[,1] = sub(" ", "", genes_matrix[,1])
    unique_genes = unique(genes_matrix[,3])
    final_matrix = matrix(-9, nrow = as.numeric(genes_matrix[1,2]), length(unique_genes))
    
    for(i in 1:length(unique_genes)){
      for(j in 1:genes_matrix[1,2]){
        final_matrix[j,i] = length(which(subset(genes_matrix, genes_matrix[ ,3] == unique_genes[i])[ ,1] == j))}}
    
    colnames(final_matrix) = unique_genes
    final_matrix_transposed = t(final_matrix)
    results = frdAllPairsConoverTest(y = as.numeric(final_matrix_transposed), groups = rep(c(1:ncol(final_matrix_transposed)), each = nrow(final_matrix_transposed)), blocks = rep(1:nrow(final_matrix_transposed), ncol(final_matrix_transposed)) , p.adjust.method = "bonf")
    print(basename(chosen_file))
    results
  }
  else {
    genes_matrix <- as.matrix(read.table(file_in, sep=" "))
    genes_matrix[,1] = sub(" ", "", genes_matrix[,1])
    unique_genes = unique(genes_matrix[,3])
    final_matrix = matrix(-9, nrow = as.numeric(genes_matrix[1,2]), length(unique_genes))
    
    for(i in 1:length(unique_genes)){
      for(j in 1:genes_matrix[1,2]){
        final_matrix[j,i] = length(which(subset(genes_matrix, genes_matrix[ ,3] == unique_genes[i])[ ,1] == j))}}
    
    colnames(final_matrix) = unique_genes
    final_matrix_transposed = t(final_matrix)
    results = frdAllPairsConoverTest(y = as.numeric(final_matrix_transposed), groups = rep(c(1:ncol(final_matrix_transposed)), each = nrow(final_matrix_transposed)), blocks = rep(1:nrow(final_matrix_transposed), ncol(final_matrix_transposed)) , p.adjust.method = "bonf")
    print(basename(file_in))
    results
  }
}



print(f_matrix(manual_choose = F, file_in = 'C:/Users/Lenovo/Desktop/STUDIA/BIOINFORMATYKA/MASTER/CANONICAL/CHROMOSOME_1/CHR1/EXONS/results_dir/EXONS_canonical_human_chr1_genes_with_4_exons.txt'))

print(f_matrix(manual_choose = TRUE))
