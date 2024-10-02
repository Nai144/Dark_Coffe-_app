import 'package:dark_coffe_app/pages/search_all_screen.dart';
import 'package:flutter/material.dart';

class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetas Populares'),
        actions: [
          IconButton(
            onPressed: (){Navigator.push( context,
            MaterialPageRoute(builder: (context) => const SearchAllScreen()));},
            icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildCafeteraCard(
            context,
            '', //aqui iran los link de las imagenes en la version final
            'Café irlandés ', 
            'Hoy quiero enseñaros cómo preparar un buen café irlandés, con la receta infalible para poder hacerlo en casa como si estuvieras en el mejor pub dublinense.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Café Árabe ', 
            'Un café estilo Árabe es una bebida de café preparada tradicionalmente con especias como azafrán, cardamomo, clavos o canela.Las especias le dan al café un sabor muy especial.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Café con leche ', 
            'Ante el ingente catálogo de bebidas que se pueden preparar con una base de café, puede parecer que el café con leche es de las más simples y sencillas.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Café cortado ', 
            'Con leche y en taza pequeña. Un tipo de café que se inspira en la forma de tomarlo en el Mediterráneo, pero que añade ese ingrediente que tan bien combina con el café.'
          ),
        ],
      ),
    );
  }

  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description) {
    return InkWell(
      onTap: () {
        // Navegar a la pantalla de detalles al pulsar sobre la tarjeta
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchRecipesScreenDetail(title: title, description: description, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(  //imagen por default
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
              height: 150,  // Ajusta la altura según sea necesario
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(description),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

class SearchRecipesScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const SearchRecipesScreenDetail({super.key, required this.title, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(  //imagen por default
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
              height: 250,  // Ajusta la altura según sea necesario
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(description),
            const SizedBox(height: 16),
            
          ],
        ),
        
      ),
      
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Acción para añadir a favoritos
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Añadido a favoritos')),
              );
            },
            tooltip: 'Añadir a favoritos',
            child: const Icon(Icons.favorite),
           ),
           const SizedBox(height: 16), // Espacio entre los botones
          FloatingActionButton(
            onPressed: () {
              // Acción para compartir
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Compartir')),
              );
            },
            tooltip: 'Compartir',
            child: const Icon(Icons.share),
          ),
        ],
      ),
      
    );
  }
}