import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _selectedIndex = 1;

 static const List<Widget> _pages = <Widget>[
    MyFavoriteScreen(),
    WelcomeScreen(),
    MyPreferencesScreen(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),       
      ),
      bottomNavigationBar: createBottomNavigationBar(),     
    );
  }

  BottomNavigationBar createBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.hotel_class_sharp),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.house_siding),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.liquor_outlined),
          label: 'Preferences',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 270.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image : NetworkImage('https://files.lafm.com.co/assets/public/styles/seoimg_1200x675_/public/2022-04/cafe_0_9.jpg?VersionId=kGk1XrKgHp2FQTfPHhVPm9pqwpkgMfE1&h=b1f6ba5c&itok=2Z3xtfVB'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Card 1', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 270.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmS0RqB5qc2fk9z1JyjzqiKExTiKZrX-nIaA&s'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Card 2', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
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