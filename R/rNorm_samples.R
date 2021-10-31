
rNorm_samples_for <- function(num_samples, length){
  sample_mat <- matrix(NA, length, num_samples)
  for (j in 1:num_samples){
    sample_mat[ , j] <- rNorm_c(length)
  }
  return(sample_mat)
}

rNorm_samples_snow1 <- function(num_samples, length){
  clus <- snow::makeCluster(3)
  snow::clusterExport(clus, "rNorm_c") 
  out <- snow::parSapply(clus, rep(length, num_samples), rNorm_c)
  snow::stopCluster(clus)
  return(out)
}

