import 'package:flutter/material.dart';
import 'package:charades/screens/game_screen.dart';
import 'package:charades/services/charade_text_service.dart'; // Import the service

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String chosenLanguage = 'en'; // Default language
  String welcomeText = 'NA'; // Initialize for welcome text

  @override
  void initState() {
    super.initState();
    _loadWelcomeText(); // Load text on startup using async function
  }

  Future<void> _loadWelcomeText() async {
    try {
      final text = await CharadeTextService.getWelcomeText(); // Use the new method
      setState(() {
        welcomeText = text;
      });
    } catch (error) {
      print('Error loading welcome text: $error'); // Log the error for debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charades Game'),
      ),
      body: ListView(
        // Adjust padding for content spacing
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        children: [
          Image.asset('assets/images/image1.png'),
          SizedBox(height: 20),
          Text(
            welcomeText, // Use loaded welcome text
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
    );
  }
}
