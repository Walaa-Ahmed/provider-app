import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback ?action;
  Timer? timer;

  Debouncer({required this.milliseconds,this.timer,this.action});

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}