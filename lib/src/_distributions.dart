import 'dart:math' show log;

class ContinuousDistibution {
  /*
  This is a generic distribution class for continuous distributions.
  */
  final Function _continuousPDF;
  final Function _continuousCDF;
  final Function _continuousRVS;

  ContinuousDistibution(
      this._continuousPDF, this._continuousCDF, this._continuousRVS);

  _pdf(x, loc, scale) {
    return scale * _continuousPDF(x - loc);
  }

  _cdf(x, loc, scale) {
    return scale * _continuousCDF(x - loc);
  }

  _rvs(loc, scale, size) {
    if (size != 1) {
      return List<double>.generate(
          size, (int index) => scale * _continuousRVS() + loc);
    } else {
      return scale * _continuousRVS() + loc;
    }
  }

  // Random variates
  rvs({loc = 0, scale = 1, size = 1}) {
    return _rvs(loc, scale, size);
  }

  // Probability density function
  pdf(x, {loc = 0, scale = 1}) {
    return _pdf(x, loc, scale);
  }

  // Natural log of the probability density function
  logpdf(x, {loc = 0, scale = 1}) {
    return log(_pdf(x, loc, scale));
  }

  // Cumulative distribution function
  cdf(x, {loc = 0, scale = 1}) {
    return _cdf(x, loc, scale);
  }

  // Natural log of the cumulative density function
  logcdf(x, {loc = 0, scale = 1}) {
    return log(_cdf(x, loc, scale));
  }

  // Survival function
  sf(x, {loc = 0, scale = 1}) {
    return 1 - _cdf(x, loc, scale);
  }

  // Natural log of the survival function
  logsf(x, {loc = 0, scale = 1}) {
    return log(1 - _cdf(x, loc, scale));
  }

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
  final Function _discretePMF;
  final Function _discreteCDF;
  final Function _discreteRVS;

  DiscreteDistribution(
      this._discretePMF, this._discreteCDF, this._discreteRVS) {}

  _pmf(x, loc, scale) {
    return scale * _discretePMF(x - loc);
  }

  _cdf(x, loc, scale) {
    return scale * _discreteCDF(x - loc);
  }

  _rvs(loc, scale, size) {
    if (size != 1) {
      return List<double>.generate(
          size, (int index) => scale * _discreteRVS() + loc);
    } else {
      return scale * _discreteRVS() + loc;
    }
  }

  // Random variates
  rvs(mu, {loc = 0, size = 1}) {
    return _rvs(mu, loc, size);
  }

  // Probability mass function
  pmf(k, mu, {loc = 0}) {
    return _rvs(k, mu, loc);
  }

  // Natural log of the probability mass function
  logpmf(k, mu, {loc = 0}) {
    return log(_rvs(k, mu, loc));
  }

  // Cumulative distribution function
  cdf(k, mu, {loc = 0}) {
    return _cdf(k, mu, loc);
  }

  // Natural log of the cumulative density function
  logcdf(k, mu, {loc = 0}) {
    return log(_cdf(k, mu, loc));
  }

  // Survival function
  sf(k, mu, {loc = 0}) {
    return 1 - _cdf(k, mu, loc);
  }

  // Natural log of the survival function
  logsf(k, mu, {loc = 0}) {
    return log(1 - _cdf(k, mu, loc));
  }

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
