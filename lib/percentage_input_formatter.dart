library percentage_input_formatter;

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PercentageInputFormatter extends TextInputFormatter {
  final double minValue, maxValue;

  static double parse(String value) {
    return double.parse(value.replaceAll('.', '').replaceAll('%', '')) ?? 0;
  }

  static String format(String value) {
    final formatter = NumberFormat('##%');
    return formatter.format(parse(value ?? 0) / 100);
  }

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      var fallback = '0';
      return newValue.copyWith(
          text: format(fallback),
          selection:
          TextSelection.collapsed(offset: format(fallback).length - 1));
    }

    double value = parse(newValue.text);

    if (minValue != null && maxValue != null) {
      if (value >= maxValue) {
        value = maxValue;
      } else if (value <= minValue) {
        value = minValue;
      }
    }

    String newText = format(value.toInt().toString());

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length - 1));
  }

  PercentageInputFormatter([this.minValue, this.maxValue]);
}

