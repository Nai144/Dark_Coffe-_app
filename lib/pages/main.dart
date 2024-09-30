import 'package:dark_coffe_app/pages/my_favorite_screen.dart';
import 'package:dark_coffe_app/pages/my_preferences_screen.dart';
import 'package:dark_coffe_app/pages/search_all_screen.dart';
import 'package:dark_coffe_app/pages/search_recipes_screen.dart';
import 'package:dark_coffe_app/pages/search_review_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: const HomePage(),
    debugShowCheckedModeBanner:false,
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

  void _onSearchPressed() {
    Navigator.push( context,
    MaterialPageRoute(builder: (context) => const SearchAllScreen()));
          
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
        actions: [
          IconButton(
            onPressed: _onSearchPressed,
            icon: const Icon(Icons.search)
          ),
        ],
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







