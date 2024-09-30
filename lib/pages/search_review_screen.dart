import 'package:flutter/material.dart';

class SearchReviewScreen extends StatelessWidget {
  const SearchReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Review Screen'),
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