// lib/classes/review.dart

class Review {
  // Atributos de la clase
  final int idReview;
  final String autor;
  final String titulo;
  final String subtitulo;
  final String descripcion;
  final String imageReference;
  final double calificacion;
  final int nCalificaciones;

  // Constructor
  Review( {
    required this.idReview,
    required this.calificacion,
    required this.nCalificaciones,
    required this.autor,
    required this.titulo,
    required this.subtitulo,
    required this.descripcion,
    required this.imageReference, 
  });

  // Convierte la Review a un mapa para almacenarla en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'idReview': idReview,
      'autor': autor,
      'titulo': titulo,
      'subtitulo': subtitulo,
      'descripcion': descripcion,
      'imageReference': imageReference,
      'calificacion': calificacion,
      'nCalificaciones': nCalificaciones,
    };
  }

  // Convierte un mapa de la base de datos a una instancia de Review
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review( 
      idReview:map['idReview'],
      autor: map['autor'],
      titulo: map['titulo'],
      subtitulo: map['subtitulo'],
      descripcion: map['descripcion'],
      imageReference: map['imageReference'],
      calificacion: map['calificacion'],
      nCalificaciones: map['nCalificaciones'],
    );
  }
}