import 'package:flutter/material.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
  SizedBox get s => this == 0
      ? const SizedBox.shrink()
      : throw Exception("The value must be zero in other to SizedBox.shrink");
}
