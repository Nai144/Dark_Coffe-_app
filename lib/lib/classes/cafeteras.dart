// lib/classes/cafeteras.dart
class Cafeteras {
  // Atributos de la clase
  final String marca;
  final String modelo;
  final int capacidad; // Capacidad en tazas
  final double precio;
  final String descripcion;


  // Constructor
  Cafeteras({
    required this.marca,
    required this.modelo,
    required this.capacidad,
    required this.precio,
    required this.descripcion,
  });

  // Método para mostrar detalles
  void mostrarDetalles() {
    print('Marca: $marca');
    print('Modelo: $modelo');
    print('Capacidad: $capacidad tazas');
    print('Precio: \$$precio');
  }
}