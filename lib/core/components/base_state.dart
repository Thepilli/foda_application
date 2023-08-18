import 'package:flutter/widgets.dart';

class BaseState extends ChangeNotifier {
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
