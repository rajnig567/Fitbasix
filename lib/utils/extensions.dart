
import 'package:flutter/material.dart';

extension XInt on int {
  Widget get widthSizedBox => SizedBox(width: toDouble());
  Widget get heightSizedBox => SizedBox(height: toDouble());
}