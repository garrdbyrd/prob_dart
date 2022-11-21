import 'dart:math' show exp, pow, sin, sqrt, pi;
import 'dart:svg';

double erf(double x) {
  /* Numerical approximation of the error function.
  Maximal error: 1.2e-7
  
  References
  ----------
  .. [1] Perrin, Charles L. "Numerical Recipes in Fortran 90: The Art of
    Scientific Computing, Volume 2 (3 CD-ROMs and Manual) By William H. 
    Press, Saul A. Teukolsky, William T. Vetterling, and Brian P. Flannery. 
    Cambridge University Press: New York, 1996." (1997): 8748-8748. */

  double t = 1 / (1 + 0.5 * x.abs());
  double y = t *
      exp(-pow(x, 2) -
          1.26551223 +
          1.00002368 * t +
          0.37409196 * pow(t, 2) +
          0.09678418 * pow(t, 3) -
          0.18628806 * pow(t, 4) +
          0.27886807 * pow(t, 5) -
          1.13520398 * pow(t, 6) +
          1.48851587 * pow(t, 7) -
          0.82215223 * pow(t, 8) +
          0.17087277 * pow(t, 9));
  double z;
  if (x >= 0) {
    z = 1 - y;
  } else {
    z = t - y;
  }
  return z;
}

int combination(int n, int k) {
  /*
  Returns the number of ways of picking k unordered outcomes 
  from n possibilities. I.e., returns the value of "n choose k".

  Helpful links
  https://mathworld.wolfram.com/Combination.html
  https://en.wikipedia.org/wiki/Combination
  */

  if (n < 0 || k < 0) {
    throw ArgumentError.value(k);
  }
  int n_minus_k = n - k;
  int n_factorial = 1;
  int k_factorial = 1;
  int n_minus_k_factorial = 1;

  for (n; n > 0; n--) {
    n_factorial *= n;
  }
  for (k; k > 0; k--) {
    k_factorial *= k;
  }
  for (n_minus_k; n_minus_k > 0; n_minus_k--) {
    n_minus_k_factorial *= n_minus_k;
  }
  int m = n_factorial ~/ (k_factorial * n_minus_k_factorial);
  return m;
}

double gamma(double x) {
  /* A numerical approximation of the gamma function using the Lanczos 
  approximation. The domain of this implementation is the real line.

  Helpful links
  https://mathworld.wolfram.com/GammaFunction.html
  https://en.wikipedia.org/wiki/Gamma_function

  https://mathworld.wolfram.com/LanczosApproximation.html
  https://en.wikipedia.org/wiki/Lanczos_approximation
  */
  List p = [
    676.5203681218851,
    -1259.1392167224028,
    771.32342877765313,
    -176.61502916214059,
    12.507343278686905,
    -0.13857109526572012,
    9.9843695780195716e-6,
    1.5056327351493116e-7
  ];

  double y;
  if (x < 0.5) {
    y = pi / (sin(pi * x) * gamma(1 - x));
  } else {
    x -= 1;
    double w = 0.99999999999980993;
    for (int i = 0; i < p.length; i++) {
      w += p[i] / (x + i + 1);
    }
    double t = x + p.length - 0.5;
    y = sqrt(2 * pi) * pow(t, (x + 0.5)) * exp(-1 * t) * x;
  }
  return y;
}

double beta(double a, double b) {
  /* Returns the Beta function for two parameters (a) and (b).

  Helpful Links
  https://mathworld.wolfram.com/BetaFunction.html
  https://en.wikipedia.org/wiki/Beta_function
  */
  double B = gamma(a) * gamma(b) / gamma(a + b);
  return B;
}

double hypergeometric(double a, double b, double c, double z) {
  /* An approximation of the hypergeometric function. The domain of this 
  implementation is the real line.

  Helpful links
  https://mathworld.wolfram.com/HypergeometricFunction.html
  https://en.wikipedia.org/wiki/Hypergeometric_function
  */

  double leading_factor = gamma(c) / (gamma(a) * gamma(b));
  double sum = 0;
  for (int i = 0; i < 100; i++) {
    double term =
        pow(z, i) * gamma(a + i) * gamma(b + i) / (gamma(c + i) * gamma(i + 1));
    sum += term;
  }
  return sum;
}

double incomplete_beta(double x, double a, double b) {
  /* An approximation of the incomplete beta function. The domain of this 
  implementation is the real line.

  Helpful links
  https://mathworld.wolfram.com/IncompleteBetaFunction.html
  https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function
  */

  double I = pow(x, a) * hypergeometric(a, 1 - b, a + 1, x) / a;
  return I;
}

double regularized_incomplete_beta(double x, double a, double b) {
  /* An approximation of the regularized incomplete beta function. The domain of this 
  implementation is the real line.

  Helpful links
  https://mathworld.wolfram.com/RegularizedBetaFunction.html
  https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function
  */
  double I = incomplete_beta(x, a, b) / beta(a, b);
  return I;
}
