import 'repartidor.dart';

// enums para los clientes
enum Ciudades { SantaMarta, Medellin, Cucuta, Barranquilla }

// Clase para los clientes
class Cliente {
  String nombre;
  String apellido;
  int id;
  Ciudades ciudad;
  double dineroEfectivo;
  Map<ColorFicha, int> fichas;

  Cliente({
    required this.nombre,
    required this.id,
    required this.apellido,
    required this.ciudad,
    required this.dineroEfectivo,
    required this.fichas,
  });
}