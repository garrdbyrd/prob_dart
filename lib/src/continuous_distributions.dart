import '_distributions.dart';
import '_mathfunctions.dart' show erf;
import 'dart:math' show pi, sqrt, exp, sqrt2, Random, log;

ContinuousDistibution norm =
    ContinuousDistibution(_norm_pdf, _norm_cdf, _norm_rvs);
/*
A normal continuous random variable.

References
.. [1] Johnson, Norman L., Samuel Kotz, and Norman L. Johnson. "Continuous 
    univariate distributions." (1970).

Helpful Links
https://mathworld.wolfram.com/NormalDistribution.html 
https://en.wikipedia.org/wiki/Normal_distribution */

double _norm_pdf(double x, double sigma) {
  /* The probability density function of a normal distribution for a real
  number [x] with standard deviation [sigma]. */
  double u = x / sigma.abs();
  double p = (1 / (sqrt(2 * pi) * sigma.abs())) * exp(-u * u / 2);
  return p;
}

double _norm_cdf(double x, double sigma) {
  /* The cumulative distribution function of a normal distribution for a real
  number x. */
  double y = 0.5 * (1 + erf(x / (sigma * sqrt2)));
  return y;
}

double _norm_rvs({double sigma = 1}) {
  /* Returns a normal (Gaussian) distribution random variate using the 
  Box-Muller transform method.
  
  https://mathworld.wolfram.com/Box-MullerTransformation.html
  https://en.wikipedia.org/wiki/Box–Muller_transform */
  var a = Random();
  var b = Random();
  double x, y;
  double r2;
  do {
    x = -1 + 2 * a.nextDouble();
    y = -1 + 2 * b.nextDouble();
    r2 = x * x + y * y;
  } while (r2 > 1.0 || r2 == 0);

  double z = sigma * y * sqrt(-2.0 * log(r2) / r2);
  return z;
}
