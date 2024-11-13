import 'package:dark_coffe_app/lib/classes/DatabaseHelper.dart';
import 'package:dark_coffe_app/lib/classes/review.dart';
import 'package:dark_coffe_app/pages/edit_recipe.dart';
import 'package:dark_coffe_app/pages/my_favorite_screen.dart';
import 'package:dark_coffe_app/pages/my_preferences/my_preferences_screen.dart';
import 'package:dark_coffe_app/pages/search_all_screen.dart';
import 'package:dark_coffe_app/pages/search_recipes_screen.dart';
import 'package:dark_coffe_app/pages/search_review_screen.dart';
import 'package:dark_coffe_app/pages/update_recipe.dart';
import 'package:dark_coffe_app/pages/user_config.dart';
import 'package:dark_coffe_app/pages/user_profile.dart';
import 'package:dark_coffe_app/pages/your_opinion.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


void main() {
  runApp(MaterialApp(
    title: 'Dark_Cofee_App',
    home: const HomePage(),
    debugShowCheckedModeBanner:false,
    theme: ThemeData(
      brightness: Brightness.dark,
    
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
  //late Future<List<Review>> futureReviews;
  //Future<List<Review>> futureReviews = DatabaseHelper.reviews();
  @override
  void initState() {
  super.initState();
  // Ejecuta la operación de inserción de manera asíncrona
  WidgetsBinding.instance.addPostFrameCallback((_) async {
   // await DatabaseHelper.insertInitialReviews();
  });
}
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
                title: const Text('Perfil'),
                onTap: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => const UserProfile()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.receipt_long),
                title: const Text('Añadir una receta/review'),
                onTap: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => const UpdateRecipe()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Mis Recetas '),
                onTap: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => const EditRecipe()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configuración'),
                onTap: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => const UserConfig()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.book_rounded),
                title: const Text('Tu opinion'),
                onTap: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => const YourOpinion()),
                  );
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
                      height: 250.0,
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
                      height: 250.0,
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






