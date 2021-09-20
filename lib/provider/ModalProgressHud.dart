import 'package:flutter/cupertino.dart';

class ModalProgress extends ChangeNotifier {
  late bool progress = false;

bool  changeProgress(val) {
    if (val == false) {
      val = true;
    } else {
      val = false;
    }

    return val;
  }
}