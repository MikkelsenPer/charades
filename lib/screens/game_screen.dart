import 'package:flutter/material.dart';
import 'package:charades_game/services/charade_text_service.dart'; // Optional (for centralized text retrieval)

class GameScreen extends StatelessWidget {
  final String chosenLanguage;

  const GameScreen({required this.chosenLanguage});

  @override
  Widget build(BuildContext context) {
    String charadeText = CharadeTextService.get
