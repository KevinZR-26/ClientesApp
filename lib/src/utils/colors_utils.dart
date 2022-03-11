import 'package:flutter/material.dart';

final _colorsApp = <String, Color?>{
  'colorPrimary': Color(int.parse('0xFF051E34')),
  'colorSecundary': Color(int.parse('0xFF1A4E7E')),
  'colorEnfoque': Color(int.parse('0xFFFFCB2B')),
  'colorFondo': Color(int.parse('0xFFEEEEEE')),
  'colorTextPrincipal': Color(int.parse('0xFF212121')),
  'colorTextSecundario': Color(int.parse('0xFF757575')),
  'colorTextHint': Color(int.parse('0xFFDCDFE7')),
};

Color? getColor(String colorName) {
  return _colorsApp[colorName];
}