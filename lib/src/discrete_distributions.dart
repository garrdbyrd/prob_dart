import '_distributions.dart';
import '_mathfunctions.dart' show combination, regularized_incomplete_beta;
import 'dart:math' show Random, pow;

DiscreteDistribution binom =
    DiscreteDistribution(_binom_pmf, _binom_cdf, _binom_rvs);
/*
A binomial discrete random variable.

References
.. [1] Johnson, Norman L., Samuel Kotz, and Adrienne W. Kemp. "Univariate 
discrete distributions." John Wiley & Sons, 2005.

.. [2] Devroye, Luc. "Nonuniform random variate generation." Handbooks in 
operations research and management science 13 (2006): 83-121.
See: Chapter X, Discrete Univariate Distributions

Helpful Links
https://mathworld.wolfram.com/BinomialDistribution.html 
https://en.wikipedia.org/wiki/Binomial_distribution */

num _binom_pmf(int k, int n, double p, {loc = 0}) {
  /* The probability mass function of a binomial distribution for a positive
  integer (n) with probability (p). */
  num m = combination(n, k) * pow(p, k) * pow(1 - p, n - k);
  return m;
}

num _binom_cdf(int k, int n, double p, {loc = 0}) {
  num m = regularized_incomplete_beta(1 - p, n - 1.0 * k, 1 + 1.0 * k);
  return m;
}

num _binom_rvs(n, p, {loc = 0, size = 1}) {
  /* Returns a binomial distribution random vairate using the Coin flip 
  method. [2]
  
  NOTE:
  This method should be replaced with either of the waiting time methods once
  one of the respective distributions are developed for this library:
  .. Geometric Distribution
  .. Exponential Distribution
  */
  int m = 0;
  var random = Random();
  for (int i = 0; i < n; i++) {
    if (random.nextDouble() < p) {
      m += 1;
    }
  }
  return m;
}
