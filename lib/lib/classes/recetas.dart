// lib/classes/recetas.dart
class Recetas {
  // Atributos de la clase
  final String autor;
  final String titulo;
  final String subtitulo;
  final String pasos;
  final int calificacion;
  final int nCalificaciones;  



  // Constructor
  Recetas(
    this.calificacion, this.nCalificaciones, {
    required this.autor,
    required this.titulo,
    required this.subtitulo,
    required this.pasos,
  });


  
}