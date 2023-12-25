

import 'package:flutter/material.dart';

class BillModel with ChangeNotifier {

  double _billAmount = 0.0;
  double get billAmount => _billAmount;
  set billAmount(double billAmount) {
    _billAmount = billAmount;
    notifyListeners();
  }

  double _tipPercentage = 0.0;
  double get tipPercentage => _tipPercentage;
  set tipPercentage(double tipPercentage) {
    _tipPercentage = tipPercentage;
    notifyListeners();
  }

  String _tipAmount = "0";
  String get tipAmount => _tipAmount;
  set tipAmount(String tipAmount) {
    _tipAmount = tipAmount;
    notifyListeners();
  }

  double calculateTotalTip() {
    return (_tipPercentage / 100) * billAmount;
  }

  double calculateTotalAmount() {
    return billAmount + calculateTotalTip();
  }

}