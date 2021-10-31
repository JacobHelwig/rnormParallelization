#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;

// [[Rcpp::export]]
arma::vec rNorm_c(int length) {
  return arma::vec(length, arma::fill::randn);
}

// [[Rcpp::export]]
Rcpp::List normal_samples(int length, int num_vecs) {
  
  Rcpp::List samples(num_vecs);
  arma::vec sample;
  
  for (int j = 0; j < num_vecs; j++){
    sample = rNorm_c(length);
    samples[j] = Rcpp::List::create(Rcpp::Named("sample mean") = mean(sample),
                                    Rcpp::Named("sample") = sample);
  }
  
  return samples;
}


