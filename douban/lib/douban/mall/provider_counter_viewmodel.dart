
import 'package:flutter/material.dart';

class ZLCounterVM extends ChangeNotifier{
  int _counter = 3;

  int get counter =>  _counter;

  set counter(int value){
    _counter = value;
    notifyListeners();
  }

}