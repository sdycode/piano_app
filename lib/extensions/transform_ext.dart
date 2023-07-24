import 'package:flutter/material.dart';

extension TransformExt on Widget {
  Widget scaleDownOctaveSlider(double scaleX, double scaleY) {
    return Transform.scale(
      scaleX: scaleX,
      scaleY: scaleY,
      child: this,
    );
  }
}
