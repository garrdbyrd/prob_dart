import 'dart:math' show log;

class ContinuousDistibution {
  /*
  This is a generic distribution class for continuous distributions.
  */
  Function _continuous_pdf;
  Function _continuous_cdf;
  Function _continuous_rvs;

  ContinuousDistibution(
      this._continuous_pdf, this._continuous_cdf, this._continuous_rvs);

  _pdf(x, loc, scale) {
    return scale * _continuous_pdf(x - loc);
  }

  _cdf(x, loc, scale) {
    return scale * _continuous_cdf(x - loc);
  }

  _rvs(loc, scale, size) {
    if (size != 1) {
      return List<double>.generate(
          size, (int index) => scale * _continuous_rvs() + loc);
    } else {
      return scale * _continuous_rvs() + loc;
    }
  }

  rvs({loc = 0, scale = 1, size = 1}) {
    return _rvs(loc, scale, size);
  }

  pdf(x, {loc = 0, scale = 1}) {
    return _pdf(x, loc, scale);
  }

  logpdf(x, {loc = 0, scale = 1}) {
    return log(_pdf(x, loc, scale));
  }

  cdf(x, {loc = 0, scale = 1}) {
    return _cdf(x, loc, scale);
  }

  logcdf(x, {loc = 0, scale = 1}) {
    return log(_cdf(x, loc, scale));
  }

  sf(x, {loc = 0, scale = 1}) {}
  logsf(x, {loc = 0, scale = 1}) {}
  ppf(q, {loc = 0, scale = 1}) {}
  isf(q, {loc = 0, scale = 1}) {}
  moment(order, {loc = 0, scale = 1}) {}
  stats({loc = 0, scale = 1, moments = 'mv'}) {}
  entropy({loc = 0, scale = 1}) {}
  fit(data) {}
  expect() {}
  median({loc = 0, scale = 1}) {}
  mean({loc = 0, scale = 1}) {}
  variance({loc = 0, scale = 1}) {}
  std({loc = 0, scale = 1}) {}
  interval(confidence, {loc = 0, scale = 1}) {}
}

class DiscreteDistribution {
  /*
  This is a generic distribution class for discrete distributions.
  */
  Function prob_mass_func;
  Function _continuous_cdf;

  DiscreteDistribution(this.prob_mass_func, this._continuous_cdf) {}
  rvs(mu, {loc = 0, size = 1}) {}

  pmf(k, mu, {loc = 0}) {
    return prob_mass_func(k - loc);
  }

  logpmf(k, mu, {loc = 0}) {}

  cdf(k, mu, {loc = 0}) {
    return _continuous_cdf();
  }

  logcdf(k, mu, {loc = 0}) {}

  sf(k, mu, {loc = 0}) {}
  logsf(k, mu, {loc = 0}) {}
  ppf(q, mu, {loc = 0}) {}
  isf(q, mu, {loc = 0}) {}
  stats(mu, {loc = 0, moments = 'mv'}) {}
  entropy(mu, {loc = 0}) {}
  expect() {}
  median(mu, {loc = 0}) {}
  mean(mu, {loc = 0}) {}
  variance(mu, {loc = 0}) {}
  std(mu, {loc = 0}) {}
  interval(confidence, mu, {loc = 0}) {}
}
