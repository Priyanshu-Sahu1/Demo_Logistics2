import 'package:flutter/material.dart';
import 'package:welcomescreen/phonescreen.dart';

import 'registerscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi, Welcome to BBT Logistics',
              style: TextStyle(fontSize: 38),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDropdown()),
                );
                // Perform register button action
                print('Register button pressed');
              },
              child: Text('Register'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Perform login button action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPhone()),
                );
                print('Login button pressed');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
