import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;
  int get redCount => _redCount;
  int get blueCount => _blueCount;

  void redIncrement() {
    _redCount++;
    notifyListeners(); // Notify UI to update
  }

  void blueIncrement() {
    _blueCount++;
    notifyListeners();
  }
}