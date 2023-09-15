

// Colores fichas
enum ColorFicha { Roja, Azul, Dorada }

// Casinos repartidor
enum Casinos {
  adenBaden,
  sunCity,
  caesarsPalace,
  bellagio,
  monteCarlo,
}

// Clase para el repartidor
class Repartidor {
  String nombre;
  String apellido;
  int id;
  Casinos casino;
  double dineroEfectivo;

  // Valores fichas
  final Map<ColorFicha, int> valores = {
    ColorFicha.Roja: 15000,
    ColorFicha.Azul: 25000,
    ColorFicha.Dorada: 50000,
  };

  Repartidor({
    required this.nombre,
    required this.apellido,
    required this.id,
    required this.casino,
    required this.dineroEfectivo,
  });
}