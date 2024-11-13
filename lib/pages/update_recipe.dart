import 'package:dark_coffe_app/lib/classes/review.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdateRecipe extends StatefulWidget {
  const UpdateRecipe({super.key});

  @override
  _UpdateRecipe createState() => _UpdateRecipe();
}

class _UpdateRecipe extends State<UpdateRecipe> {
  File? _image;
  final picker = ImagePicker();

  // Controladores para los campos de texto
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _selectedOption;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir una Review'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
         
        children: <Widget>[
          ListTile(
            title: const Text('Adjuntar una imagen'),
            subtitle: const Text('*'),
            trailing: IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                _showImageSourceDialog();
              },
            ),
          ),
          _image != null
              ? Image.file(
                  _image!,
                  height: 200,
                  fit: BoxFit.cover,
                )
              : const SizedBox(height: 200, child: Placeholder()),
          const Divider(),
          DropdownButton<String>(
            value: _selectedOption,
            items: <String>['Review', 'Receta'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue!;
              });
            },
          ),
          // Campo para el título
          ListTile(
            title: const Text('Título'),
            subtitle: TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Ingrese el título de la review'),
            ),
          ),
          const Divider(),

          // Campo para el subtítulo
          ListTile(
            title: const Text('Subtítulo'),
            subtitle: TextField(
              controller: _subtitleController,
              decoration: const InputDecoration(hintText: 'Ingrese el subtítulo (opcional)'),
            ),
          ),
          const Divider(),

          // Campo para la descripción
          ListTile(
            title: const Text('Descripción'),
            subtitle: TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(hintText: 'Ingrese la descripción detallada'),
            ),
          ),
          const Divider(),

          // Botón para guardar la review
          ElevatedButton(
            onPressed: () {              
              final newReview = Review(
                imageReference: _image?.path ?? '',
                titulo: _titleController.text,
                subtitulo: _subtitleController.text,
                descripcion: _descriptionController.text,
                autor: 'Nombre del Autor', 
                calificacion: 0, 
                nCalificaciones: 0, idReview: 1, 
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Review añadida')),
              );
            },
            child: const Text('Guardar Review'),
          ),
        ],
      ),
    );
  }

  // Diálogo para seleccionar la fuente de la imagen
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Selecciona una opción'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Cámara'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: const Text('Galería'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}