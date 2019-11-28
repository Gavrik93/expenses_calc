
import 'package:flutter/foundation.dart';
//blueprint for a normal Dart object, dont use it like a Widget
class Trasaction {
//define how it's should look like, runtime consant
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //constructor for named arguments, we dont need to remember position of argument
  Trasaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
