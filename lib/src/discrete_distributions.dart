import '_distributions.dart';
import '_mathfunctions.dart' show combination, regularizedIncompleteBeta;
import 'dart:math' show Random, pow;

DiscreteDistribution binom =
    DiscreteDistribution(_binomPMF, _binomCDF, _binomRVS);
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

num _binomPMF(int k, int n, double p, {loc = 0}) {
  /* The probability mass function of a binomial distribution for a positive
  integer (n) with probability (p). */
  num m = combination(n, k) * pow(p, k) * pow(1 - p, n - k);
  return m;
}

num _binomCDF(int k, int n, double p, {loc = 0}) {
  num m = regularizedIncompleteBeta(1 - p, n - 1.0 * k, 1 + 1.0 * k);
  return m;
}

num _binomRVS(n, p, {loc = 0, size = 1}) {
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
