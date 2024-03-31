import 'dart:async';

import 'package:flutter/material.dart';
import 'package:charades/services/charade_text_service.dart'; // Optional (for centralized text retrieval)

class GameScreen extends StatefulWidget {
  final String chosenLanguage;

  const GameScreen({required this.chosenLanguage});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String charadeText = '';
  int remainingTime = 60; // Timer duration (seconds)
  bool isTimerRunning = false; // Flag for timer state
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _loadNewText(); // Load initial text on startup
  }

  Future<void> _loadNewText() async {
    final text = await CharadeTextService.getCharadeText(widget.chosenLanguage);
    setState(() {
      charadeText = text;
      remainingTime = 60; // Reset timer on new text
      isTimerRunning = true;
      _startTimer();
    });
  }

  void _startTimer() {
    timer?.cancel(); // Cancel any existing timer
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (mounted) {
        setState(() {
          remainingTime--;
          if (remainingTime == 0) {
            isTimerRunning = false;
            timer?.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer on widget disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charades Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Timer display with color change
            Text(
              remainingTime == 0 ? 'Times Up' : remainingTime.toString(),
              style: TextStyle(
                fontSize: 32,
                color: remainingTime <= 10 ? Colors.red : Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              charadeText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _loadNewText,
              child: Text('Load New Text'),
            ),
          ],
        ),
      ),
    );
  }
}
