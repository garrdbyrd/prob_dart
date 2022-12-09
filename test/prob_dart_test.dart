import 'package:prob_dart/prob_dart.dart';
import 'package:prob_dart/src/_distributions.dart';

void main() {
  var randomVariate = norm.rvs(size: 100);
  for (int i = 0; i < 100; i++) {
    print(randomVariate[i]);
  }
}
