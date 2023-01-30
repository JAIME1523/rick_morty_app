import 'package:flutter/material.dart';

class AppbarProvider with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
