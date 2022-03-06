import 'package:flutter/material.dart';
import 'package:hackufaz/models/farms.dart';

class FarmerProvider extends ChangeNotifier {
  
  List<Farms>? _farmsData;

  updateFarms(List<Farms> newFarmsData) {
    _farmsData = newFarmsData;
    notifyListeners();
  }

  List<Farms>? get farms => _farmsData;

  void doNotify(){
    notifyListeners();
  }
}
