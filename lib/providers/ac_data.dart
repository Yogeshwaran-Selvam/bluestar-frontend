import 'package:flutter/material.dart';
import '../models/ac_model.dart';

class ACProvider with ChangeNotifier {
  late ACModel _ac;

  set setAc (ac) => _ac = ac;
  ACModel get getAc => _ac;

  void togglePower() {
    _ac.isPowerOn = !_ac.isPowerOn;
    notifyListeners();
  }

  void setTemperature(int temp) {
    _ac.temperature = temp;
    notifyListeners();
  }

  void setMode(String mode) {
    _ac.mode = mode;
    notifyListeners();
  }

  void setFanSpeed(String mode) {
    _ac.fanSpeed = mode;
    notifyListeners();
  }

  
}
