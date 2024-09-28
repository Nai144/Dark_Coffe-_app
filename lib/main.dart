import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: const HomePage(),
    theme: ThemeData(
      brightness: Brightness.dark,
    //  primaryColor: Colors.lightBlue[800],
     // hintColor: Colors.cyan[600],
    ),
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
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.amber[800],
          ),
        ),
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
               DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber[800],
                ),
                child: const Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio'),
                onTap: () {
                  // Acción al pulsar el item
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configuración'),
                onTap: () {
                  // Acción al pulsar el item
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
            InkWell(
              onTap: (){
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const SearchRecipesScreen()),
                );
              },
              child: Card(
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
                      child: Text('Recetas',
                        style: TextStyle(fontSize: 18,
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: (){
                Navigator.push( context,
                MaterialPageRoute(builder: (context) => const SearchReviewScreen()),
                );
              },
              child: Card(
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
                      child: Text('Reviews',
                        style: TextStyle(fontSize: 18,
                          
                        ),
                      ),
                    ),
                  ],
                ),
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
        title: Text('Mis Favoritos Screen',
          style: TextStyle(
            color: Colors.amber[800]
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!',
            
          ),
          
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
        title: Text(
          'Mis Preferencias Screen',
          style: TextStyle(
            color: Colors.amber[800],
          ) ,
        ),
      ),
      body: Center(
        child: 
        ElevatedButton(
          child: Text('My Preferences List Screen',
            style: TextStyle(
              color: Colors.amber[800],
            ),
          ),
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
          child: Text('Go back!',
            style: TextStyle(color: Colors.amber[800])
          ),
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
          child: Text('Go back!',
            style: TextStyle(color: Colors.amber[800])
          ),
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