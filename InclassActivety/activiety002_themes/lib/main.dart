import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // use this method method to change the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
// standard dark theme
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Demo '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose the Theme:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                // Create two buttons here and change the theme when the button is pressed.
                //use children[] and create two button inside it
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    onPressed: () {
                      // Toggle between light and dark mode
                      if (_themeMode == ThemeMode.light) {
                        changeTheme(ThemeMode.dark);
                      } else {
                        changeTheme(ThemeMode.light);
                      }
                    },
                    child: Text('Change Theme'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
