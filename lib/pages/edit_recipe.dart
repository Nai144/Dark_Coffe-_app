import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para leer archivos de assets
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class Recipe {
  String title;
  String description;
  String imagePath;

  Recipe({required this.title, required this.description, required this.imagePath});

  
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
    );
  }
}

class EditRecipe extends StatefulWidget {
  const EditRecipe({super.key});

  @override
  _EditRecipeState createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  late Future<List<Recipe>> _recipes;

  @override
  void initState() {
    super.initState();
    _recipes = _loadRecipes();
  }

  // Método para cargar las recetas desde un archivo JSON
  Future<List<Recipe>> _loadRecipes() async {
    final String response = await rootBundle.loadString('lib/assets/recipes.json');
    final List<dynamic> data = json.decode(response);
    return data.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Recetas'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: _recipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar las recetas'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay recetas disponibles'));
          } else {
            List<Recipe> recipes = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = recipes[index];
                return buildCafeteraCard(
                  context,
                  recipe.imagePath,
                  recipe.title,
                  recipe.description,
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditRecipeDetail(title: title, description: description, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              imagePath.isNotEmpty ? imagePath : '',
              height: 150,
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

class EditRecipeDetail extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;

  const EditRecipeDetail({super.key, required this.title, required this.description, required this.imagePath});

  @override
  _EditRecipeDetailState createState() => _EditRecipeDetailState();
}

class _EditRecipeDetailState extends State<EditRecipeDetail> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
    _loadData();
    _loadImage();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _titleController.text = prefs.getString('title_${widget.title}') ?? widget.title;
      _descriptionController.text = prefs.getString('description_${widget.title}') ?? widget.description;
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('title_${widget.title}', _titleController.text);
    await prefs.setString('description_${widget.title}', _descriptionController.text);
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedImagePath = prefs.getString('imagePath_${widget.title}');
    if (savedImagePath != null) {
      setState(() {
        _image = File(savedImagePath);
      });
    }
  }

  Future<void> _saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath_${widget.title}', path);
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _saveImagePath(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar ${widget.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image != null
                ? Image.file(_image!, height: 250, width: double.infinity, fit: BoxFit.cover)
                : Image.network(
                    widget.imagePath,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Cambiar Imagen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveData();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Receta Editada')),
          );
        },
        tooltip: 'Guardar Cambios',
        child: const Icon(Icons.save),
      ),
    );
  }
}