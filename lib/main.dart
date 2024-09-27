import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Search All Screen'),
              onPressed: () {
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const SearchAllScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Search Review Screen'),
              onPressed: () {
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const SearchReviewScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Search Recipes Screen'),
              onPressed: () {
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const SearchRecipesScreen()),
                );
              },
            ),
          ],
        ), 
      ),
      persistentFooterButtons: <Widget>[
        IconButton(icon: const Icon(Icons.liquor_outlined), //Go to MY Prefernces
          onPressed: () {
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const MyPreferencesScreen()),
                );
          },
          padding: const EdgeInsets.all(45.0),
        ),       
        IconButton(icon: const Icon(Icons.hotel_class_sharp), //Go to MY favorites
          onPressed: () {
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const MyFavoriteScreen()),
                );
          },
          padding: const EdgeInsets.all(45.0),
        ),
        IconButton(icon: const Icon(Icons.library_add_sharp), //Go to MY recipes
          onPressed: () {
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const MyRecipesScreen()),
                );
          },
          padding: const EdgeInsets.all(45.0),
          mainAxisAlignment: MainAxisAlignment.start
        ),   
      ],
      
    );
  }
}

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
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
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
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes Screen'),
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
class MyRecipesScreen extends StatelessWidget {
  const MyRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Recipes Screen'),
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
class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Favoritos Screen'),
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
class MyPreferencesScreen extends StatelessWidget {
  const MyPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Preferencias Screen'),
      ),
      body: Center(
        child: 
        ElevatedButton(
          child: const Text('My Preferences List Screen'),
            onPressed: () {
              Navigator.push( context,
              MaterialPageRoute(builder: (context) => const MyPreferencesListScreen()),
              );
          },
        ),
      ),
    );
  }
}
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
              MaterialPageRoute(builder: (context) => const MyPreferencesDetailScreen()),
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