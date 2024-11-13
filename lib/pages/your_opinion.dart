import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class Question {
  String titulo;
  int valor;
  String min;
  String max;

  Question({required this.titulo, required this.valor, required this.min, required this.max});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      titulo: json['titulo'],
      valor: json['valor'],
      min: json['min'],
      max: json['max'],
    );
  }

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'valor': valor,
        'min': min,
        'max': max,
      };
}

class OpinionCategory {
  String category;
  List<Question> questions;

  OpinionCategory({required this.category, required this.questions});

  factory OpinionCategory.fromJson(String category, List<dynamic> json) {
    return OpinionCategory(
      category: category,
      questions: json.map((q) => Question.fromJson(q)).toList(),
    );
  }
}

class YourOpinion extends StatefulWidget {
  const YourOpinion({Key? key}) : super(key: key);

  @override
  _YourOpinionScreenState createState() => _YourOpinionScreenState();
}

class _YourOpinionScreenState extends State<YourOpinion> {
  List<OpinionCategory> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  Future<Map<String, dynamic>> _loadOpinionQuestions() async {

    var jsonString = await rootBundle.loadString('lib/assets/opinion_questions.json');
    
    return json.decode(jsonString);
  }

  Future<void> _loadData() async {
    final data = await _loadOpinionQuestions();
    setState(() {
      _categories = data.keys
          .map((category) => OpinionCategory.fromJson(category, data[category]))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Opinion"),
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return ExpansionTile(
            title: Text(category.category),
            children: category.questions.map((q) {
              return ListTile(
                title: Text(q.titulo),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(q.min),
                    Slider(
                      value: q.valor.toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      label: q.valor.toString(),
                      onChanged: (newValue) {
                        setState(() {
                          q.valor = newValue.toInt();
                        });
                      },
                    ),
                    Text(q.max),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitResponses,
        child: const Icon(Icons.send),
      ),
    );
  }

  void _submitResponses() {
  final responses = _categories.map((category) {
    final questions = category.questions.map((q) {
      return '${q.titulo}: ${q.valor}/5\n';
    }).join('\n');
    return '${category.category}\n$questions';
  }).join('\n\n');

  final mailtoLink = Mailto(
    to: ['ipjavier144@gmail.com'],
    subject: 'Respuestas de opinión',
    body: responses,
  );

  launchUrl(Uri.parse(mailtoLink.toString()));
}
}