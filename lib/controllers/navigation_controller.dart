// lib/controllers/navigation_controller.dart
import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 1;               // 0 = Dashboard by default
  int get selectedIndex => _selectedIndex;

  void setIndex(int newIndex) {
    if (newIndex != _selectedIndex) {
      _selectedIndex = newIndex;
      notifyListeners();
    }
  }
}
