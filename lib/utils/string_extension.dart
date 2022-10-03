import 'package:flutter/material.dart';

extension StringExtension on String {
  String get withoutLinebreaks {
    return replaceAll('\n', ' ').replaceAll('\f', ' ');
  }

  String get capitalized {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }



}




