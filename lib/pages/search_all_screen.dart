import 'package:flutter/material.dart';

class SearchAllScreen extends StatelessWidget {
  const SearchAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search All Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!',
            style: TextStyle(color: Colors.amber[800])
          ),
        ),
      ),
    );
  }
}