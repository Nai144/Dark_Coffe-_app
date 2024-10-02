import 'package:flutter/material.dart';

class MyPreferencesListOtherScreen extends StatelessWidget {
  const MyPreferencesListOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accesorios u Otros'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildCafeteraCard(
            context,
            '', //aqui iran los link de las imagenes en la version final
            'Spoon Clip / Cuchara Clip ', 
            '¿Tienes problemas para cerrar tu paquete de café? En Cafeteros Chile tenemos la solución perfecta para ti. Nunca más tendrás que preocuparte por cómo cerrar el paquete y conservar la frescura de tus granos. Imagina disfrutar de la medida perfecta en cada una de tus preparaciones. Ya no necesitarás elásticos o perritos de ropa que no garantizan la frescura del café. \$9.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Pitcher barista ', 
            'Ir a tu cafetería favorita, puede transformarse en ir de tu cama a tu cocina En una de esas te transformas en tu mejor versión de barista, hacer un cappuccino o un latte con este pitcher créenos que va a ser diferente. Pitcher acero inoxidable de 600ml y 420ml \$24.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Termo negro 1lt', 
            'Termos hay literalmente miles en el mercado, lo sabemos... Pero de esos miles, los que realmente son termos son muy pocos, también lo sabemos. Es por eso que con este Termo EQUA te vas a la segura, literalmente dura el agua caliente 12 horas garantizadas y el agua fría dentro duras días. \$35.99.'
          ),
        ],
      ),
    );
  }

  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyPreferencesDetailOtherScreen(title: title, description: description, imagePath: imagePath),
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

class MyPreferencesDetailOtherScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const MyPreferencesDetailOtherScreen({super.key, required this.title, required this.description, required this.imagePath});

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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Añadido a preferencias')),
              );
            },
            tooltip: 'Añadir a preferencias',
            child: const Icon(Icons.star),
           ),
           const SizedBox(height: 16), 
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