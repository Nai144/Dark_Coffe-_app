import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: const Text('Nombre'),
            subtitle: const Text('Ian Javier'),  
          ),
          const Divider(),  
          ListTile(
            title: const Text('Correo'),
            subtitle: const Text(' '),  
          ),
          const Divider(),
          ListTile(
            title: const Text('Edad'),
            subtitle: const Text('25'),  
          ),
          const Divider(),
          ListTile(
            title: const Text('Descripción'),
            subtitle: const Text('Interesado en Aprender a hacer cafes y postres'), 
          ),
        ],
      ),
    );
  }
}