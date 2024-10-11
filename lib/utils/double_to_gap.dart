import 'package:flutter/material.dart';

extension DoubleToGap on double {
  Widget get toVerticalGap => SizedBox(
        height: this,
      );

  Widget get toHorizontalGap => SizedBox(
        width: this,
      );

  Widget get toSquareGap => SizedBox(
        width: this,
        height: this,
      );
}
