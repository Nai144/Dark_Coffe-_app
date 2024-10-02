import 'package:flutter/material.dart';

class UserConfig extends StatelessWidget {
  const UserConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: const Text('Idioma'),
            subtitle: const Text('Español'),  
          ),
          const Divider(),   
          ListTile(
            title: const Text('Tamaño de fuente'),
            subtitle: const Text('Mediana'),  
          ),
          const Divider(),
          ListTile(
            title: const Text('País'),
            subtitle: const Text('Chile'),  
          ),
          const Divider(),
          ListTile(
            title: const Text('Tipo de divisa'),
            subtitle: const Text('CLP'),  
          ),
        ],
      ),
    );
  }
}