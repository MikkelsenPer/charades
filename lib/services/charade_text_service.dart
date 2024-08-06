import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';

class CharadeTextService {
  static Future<String> getCharadeText(String language) async {
    // Existing method for loading charade text (unmodified)
    try {
      final text = await rootBundle.loadString('assets/charade_text_$language.txt');
      final lines = text.split('\n');
      final randomIndex = Random().nextInt(lines.length);
      return lines[randomIndex];
    } on FileSystemException {
      return 'Error retrieving charade text.';
    }
  }

  static Future<String> getWelcomeText() async {
    // New method for loading welcome text
    try {
      // Assuming the welcome text is in a file named "welcome.txt"
      print("Starting to load text");
      final text = await rootBundle.loadString('assets/welcome.txt');
      print("waited");
      final lines = text.split('\n');
      print("Text $lines");
      return text;
    } on FileSystemException {
      return 'Error retrieving welcome text.';
    }
  }
}
