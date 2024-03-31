import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for loading text
import 'package:charades/screens/game_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String chosenLanguage = 'en'; // Default language
  String welcomeText = ''; // Initialize for welcome text

  @override
  void initState() {
    super.initState();
    loadWelcomeText(); // Load text on startup
  }

  Future<void> loadWelcomeText() async {
    final text = await rootBundle.loadString('assets/welcome.txt');
    setState(() {
      welcomeText = text;
    });
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
            'Welcome to Charades!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            welcomeText,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 40),
          Image.asset('assets/images/image2.png'),
          SizedBox(height: 40),
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
