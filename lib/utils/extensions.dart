import 'package:flutter/material.dart';

extension StringExtension on double {
  SizedBox get mh => SizedBox(height: this);
  SizedBox get mw => SizedBox(width: this);
}
