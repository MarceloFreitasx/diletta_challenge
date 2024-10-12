import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  //! Heading
  /// Heading 1 - 34 - Bold
  static const TextStyle head1 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
  );

  /// Heading 1 - 28 - SemiBold
  static const TextStyle head2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  /// Heading 1 - 22 - Medium
  static const TextStyle head3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  //! Body
  /// Body 1 - 17 - Medium
  static const TextStyle body1 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  /// Body 2 - 15 - Regular
  static const TextStyle body2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  /// Body 3 - 13 - Regular
  static const TextStyle body3 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  /// Body 4 - 11 - Regular
  static const TextStyle body4 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
}
