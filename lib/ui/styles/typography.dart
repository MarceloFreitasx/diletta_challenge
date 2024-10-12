import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  //! Heading
  /// Heading 1 - 28 - Bold
  static const TextStyle head1 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
  );

  //! Body
  /// Body 1 - 17 - Medium
  static const TextStyle body1 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  /// Body 2 - 15 - Medium
  static const TextStyle body2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}
