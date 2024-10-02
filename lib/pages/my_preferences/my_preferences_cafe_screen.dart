import 'package:flutter/material.dart';

class MyPreferencesListCafeScreen extends StatelessWidget {
  const MyPreferencesListCafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Café'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildCafeteraCard(
            context,
            '', //aqui iran los link de las imagenes en la version final
            '1KG Café de Especialidad Blend Huila, Colombia en Grano o Molido', 
            'Proveniente de varias fincas de la región de Huila, Colombia, para ser tostado y envasado en Chile . Es un café con fragancia a caña dulce y floral, con notas a naranja, durazno y nueces. \$23.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Café grano molido Buffalo Soldier 227 g', 
            'Descubre el poder de la naturaleza en cada taza con nuestra mezcla de café, caracterizada por su sabor intenso y aroma embriagador. Sus notas ahumadas y chocolateadas aportan un perfil de sabor único que estimula tus sentidos, el compañero perfecto para aquellos momentos en que necesitas un impulso de energía durante tu día. Disfrútalo al ritmo de tu playlist favorita. Este paquete incluye 227 gramos de café molido listo para deleitar tus papilas gustativas. \$11.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Café Liofilizado Tradicional 50 g', 
            'Disfruta del auténtico sabor del café colombiano con nuestro Café Soluble Liofilizado Tradicional. Elaborado 100% con café de Colombia, este producto garantiza un sabor y aroma incomparables, manteniendo siempre su excelente calidad. Su proceso de liofilización conserva todas las características esenciales del café, ofreciendo una experiencia única en cada taza. \$5.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Café Liofilizado Orgánico 95 g', 
            'Descubre el Café Soluble Liofilizado Orgánico de Juan Valdez. Este café premium, elaborado 100% con café colombiano, destaca por su sabor auténtico y su aroma delicioso. Nuestro proceso de liofilización preserva la esencia pura del café, mientras que su certificación orgánica garantiza que fue producido sin pesticidas ni productos químicos, empleando técnicas agrícolas sostenibles. \$7.99.'
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
            builder: (context) => MyPreferencesDetailCafeScreen(title: title, description: description, imagePath: imagePath),
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
              height: 150,  // 
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

class MyPreferencesDetailCafeScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const MyPreferencesDetailCafeScreen({super.key, required this.title, required this.description, required this.imagePath});

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