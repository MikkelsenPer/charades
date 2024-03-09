import 'package:flutter/material.dart';
import 'package:charades_game/screens/game_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String chosenLanguage = 'en'; // Default language

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
            Text(
              'Welcome to Charades!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Choose your language:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'da',
                  groupValue: chosenLanguage,
                  onChanged: (value) {
                    setState(() {
                      chosenLanguage = value as String;
                    });
                  },
                ),
                Text('Danish'),
                SizedBox(width: 20),
                Radio(
                  value: 'en',
                  groupValue: chosenLanguage,
                  onChanged: (value) {
                    setState(() {
                      chosenLanguage = value as String;
                    });
                  },
                ),
                Text('English'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(chosenLanguage: chosenLanguage),
                  ),
                );
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
