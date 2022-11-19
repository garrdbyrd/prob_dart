import 'package:prob_dart/prob_dart.dart';
import 'package:prob_dart/src/_distributions.dart';

void main() {
  var random_variate = norm.rvs(size: 100);
  for (int i = 0; i < 100; i++) {
    print(random_variate[i]);
  }

  //print(random_variate);
}
