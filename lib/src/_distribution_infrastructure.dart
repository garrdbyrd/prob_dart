import 'dart:ffi';

// NOTE: Distribution may be a base class, as a collection of generic methods, it doesn't need to have these generic field names.
//       Concerete implementations may have meaningful field names instead. 
abstract class Distibution {
  // NOTE: if something won't change between the calls, and its likely implementation is a calculation that happens at one time, then it could be a getter instead of a method
  // e.g.:
  double get std;
  double get median;
  // NOTE: the above types could be num as well, but there is very little point if in the 99.9% of the cases it won't be int, rather a floating point number
  
  // NOTE: it would be helpful to have short documentation descriptions for all of these, even for median and mean, because not everyone would be aware of the abbreviations right away.
  rvs() {}
  pdf() {}
  logpdf() {}
  cdf() {}
  logcdf() {}
  sf() {}
  logsf() {}
  ppf() {}
  isf() {}
  moment() {}
  stats() {}
  entropy() {}
  fit() {}
  expect() {}
  median() {}
  mean() {}
  variance() {}
  std() {}
  interval() {}
}
