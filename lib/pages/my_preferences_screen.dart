import 'package:flutter/material.dart';
import 'package:dark_coffe_app/pages/my_preferences_list_screen.dart';

class MyPreferencesScreen extends StatelessWidget {
  const MyPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Preferencias Screen',
          style: TextStyle(
            color: Colors.amber[800],
          ) ,
        ),
      ),
      body: Center(
        child: 
        
      ),
    );
  }
}
/*
onPressed: () {
              Navigator.push( context,
              MaterialPageRoute(builder: (context) => const MyPreferencesListScreen()),
              );
          },
*/