import 'package:flutter/material.dart';

class AddWalletMoneyController extends ChangeNotifier {
  int _selectedCardIndex = 0;

  int get selectedCardIndex => _selectedCardIndex;

  set changeIndex(int index) {
    _selectedCardIndex = index;
    notifyListeners();
  }
}
