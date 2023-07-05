import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE3E2ED),
  100: Color(0xFFB8B6D1),
  200: Color(0xFF8985B3),
  300: Color(0xFF5A5495),
  400: Color(0xFF36307E),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF110A5F),
  700: Color(0xFF0E0854),
  800: Color(0xFF0B064A),
  900: Color(0xFF060339),
});
const int _primaryPrimaryValue = 0xFF130B67;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF736FFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF1009FF),
  700: Color(0xFF0700EF),
});
const int _primaryAccentValue = 0xFF423CFF;