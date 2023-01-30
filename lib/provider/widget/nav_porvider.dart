import 'package:flutter/material.dart';

enum ViewsStatus { home, episode, location, gratitude }

class NavProvider extends ChangeNotifier {
  ViewsStatus _viewStatus = ViewsStatus.home;

  ViewsStatus get viewStatus => _viewStatus;

  set viewStatus(ViewsStatus value) {
    _viewStatus = value;
    notifyListeners();
  }
}
