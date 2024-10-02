import 'package:flutter/material.dart';

class UpdateRecipe extends StatelessWidget {
  const UpdateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subir una Receta'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: const Text('Adjuntar una imagen'),
            subtitle: const Text('*'),  
          ),
          const Divider(),  

          ListTile(
            title: const Text('Titulo'),
            subtitle: const Text('*'),  
          ),
          const Divider(),
          ListTile(
            title: const Text('Subtitulo'),
            subtitle: const Text('La gente vera esto junto al titulo'),  
          ),
          const Divider(),
          ListTile(
            title: const Text('Ingredientes'),
            subtitle: const Text('*'),  
          ),
          ListTile(
            title: const Text('Pasos a Seguir'),
            subtitle: const Text('*'),  
          ),
        ],
      ),
    );
  }
}