import 'package:flutter/material.dart';

class MyPreferencesListScreen extends StatelessWidget {
  const MyPreferencesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Preferences List Screen'),
      ),
      body: Center(
        child: 
        ElevatedButton(
          child: const Text('My Preferences Detail Screen'),
            onPressed: () {
              Navigator.push( context,
              MaterialPageRoute(builder: (context) =>  const MyPreferencesDetailScreen()),
              );
          },
        ),
      ),
    );
  }
}

class MyPreferencesDetailScreen extends StatelessWidget {
  const MyPreferencesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Preferences Detail Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
