import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  bool get isSafeArea => MediaQuery.of(this).viewPadding.bottom >= 34.0;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  void hideKeyboard() => FocusScope.of(this).unfocus();
}
