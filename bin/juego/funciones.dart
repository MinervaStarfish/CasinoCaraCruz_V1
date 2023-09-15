import 'dart:math';
import '../clases/repartidor.dart';

// Funcion para fichas
ColorFicha colorFichas() {
  int random = Random().nextInt(3);

  if (random == 0) {
    return ColorFicha.Roja;
  } else if (random == 1) {
    return ColorFicha.Azul;
  } else {
    return ColorFicha.Dorada;
  }
}

// Función random de cara o cruz
int lanzarMoneda() {
  Random random = Random();
  return random.nextInt(2);
}

// Funcion para resultado de random cara o cruz
String? gameResults(int machine, int user) {
  if (machine == 0) {
    return 'Perdió esta apuesta';
  } else {
    return 'Ganó esta apuesta';
  }
}

