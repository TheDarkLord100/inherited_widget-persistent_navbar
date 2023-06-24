import 'package:flutter/material.dart';

extension Extensions on Widget {
  Center wrapCenter() => Center(
    child: this,
  );

  Padding padding(double value) => Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );
}