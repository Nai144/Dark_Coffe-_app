import 'package:flutter/material.dart';

class SearchAllScreen extends StatelessWidget {
  const SearchAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                buildCafeteraCard(
                  context,
                  '', //aqui iran los link de las imagenes en la version final
                  'Assuan Concepcion ', 
                  'Los cafes son de maquina, pero son baratos y muy grandes, es sabor es normal, pero en lo que se destaca aqui son los dulces los cuales son extremadamente ricos, ademas de que no te costaran un ojo de la cara.'
                ),       
                buildCafeteraCard(
                  context,
                  '', 
                  'Mar Bella Concepcion ', 
                  'Un lugar clasico si vas a Concepcion, siempre he prefiro este lugar a la fuente alemana, los cafes cortados con las torta amor son excelentes. '
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Tarjeta de accesorio
  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchAllScreenDetail(
              title: title,
              description: description,
              imagePath: imagePath,
            ),
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

class SearchAllScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const SearchAllScreenDetail({super.key, required this.title, required this.description, required this.imagePath});

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
            Image.network(
              imagePath,
              height: 250,
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
    );
  }
}