# rm(list = ls())
# library(rnormParallelization)
# library(snow)
# 
# clus <- makeCluster(3)
# clusterExport(clus, "rNorm_c")
# parSapply(clus, rep(10, 15), rNorm_c)
# stopCluster(clus)
# 
# clus <- makeCluster(3)
# clusterExport(clus, library(rnormParallelization))
# parSapply(clus, rep(10, 10), rNorm_c)
# stopCluster(clus)

microbenchmark::microbenchmark(
  rnormParallelization::rNorm_samples_for(1e3, 1e4),
  rnormParallelization::rNorm_samples_snow1(1e3, 1e4)
)
