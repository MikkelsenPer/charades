import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';

class CharadeTextService {
  static Future<String> getCharadeText(String language) async{
    try {
      final text = await rootBundle.loadString('assets/charade_text_$language.txt');
      print(" file");
      // Process the text content
      final lines = text.split('\n');  // Split the string by newline character
      print("lines");
      final randomIndex = Random().nextInt(lines.length);
      return lines[randomIndex];
    } on FileSystemException {
      // Handle potential file system errors (e.g., file not found)
      print('Error reading charade text file for language: $language');
      return 'Error retrieving charade text.';
    }
  }
}