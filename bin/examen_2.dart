import 'dart:math';

import 'package:examen_2/examen_2.dart' as examen_2;
import 'clases/cliente.dart';
import 'clases/repartidor.dart';
import 'juego/funciones.dart';

void main(List<String> arguments) {
  // Objeto de Cliente 1
  Cliente cliente1 = Cliente(
    nombre: 'Julieta',
    apellido: 'Ruiz',
    id: 123,
    ciudad: Ciudades.Cucuta,
    dineroEfectivo: 0,
    fichas: {
      ColorFicha.Roja: 14,
      ColorFicha.Azul: 7,
      ColorFicha.Dorada: 3,
    },
  );

  // Objeto de Cliente 2
  Cliente cliente2 = Cliente(
    nombre: 'Michael',
    apellido: 'París',
    id: 456,
    ciudad: Ciudades.Medellin,
    dineroEfectivo: 0,
    fichas: {
      ColorFicha.Roja: 2,
      ColorFicha.Azul: 6,
      ColorFicha.Dorada: 7,
    },
  );

  // Objeto de Repartidor
  Repartidor miRepartidor = Repartidor(
    nombre: 'Sofía',
    apellido: 'Hernandez',
    id: 000,
    casino: Casinos.monteCarlo,
    dineroEfectivo: 0,
  );

  int ronda = 1;

  while (cliente1.fichas.isNotEmpty && cliente2.fichas.isNotEmpty) {
    print('Ronda $ronda:');

    // Elección del color de ficha y cantidad a apostar por cliente
    ColorFicha colorCliente1 = colorFichas();
    int cantidadApostada1 = Random().nextInt(5) + 1;

    ColorFicha colorCliente2 = colorFichas();
    int cantidadApostada2 = Random().nextInt(5) + 1;

    // Lanzamiento de la moneda para determinar el ganador
    int resultadoMoneda = lanzarMoneda();

    // Resultados de la ronda
    if (resultadoMoneda == 0) {
      cliente1.fichas[colorCliente1] =
          cliente1.fichas[colorCliente1]! - cantidadApostada1;
      cliente2.fichas[colorCliente2] =
          cliente2.fichas[colorCliente2]! - cantidadApostada2;
      miRepartidor.dineroEfectivo += cantidadApostada1 + cantidadApostada2;
      print(
          'Empate. Se han quitado $cantidadApostada1 fichas $colorCliente1 al cliente 1 y $cantidadApostada2 fichas $colorCliente2 al cliente 2.');
    } else if (cliente2.fichas[colorCliente2]! >
        cliente1.fichas[colorCliente1]!) {
      int cantidadGanada = cantidadApostada1 + cantidadApostada2;
      double dineroGanado = cantidadGanada * 0.9;
      double comisionRepartidor = cantidadGanada * 0.1;
      cliente2.dineroEfectivo += dineroGanado;
      miRepartidor.dineroEfectivo += comisionRepartidor;
      cliente2.fichas[colorCliente2] =
          cliente2.fichas[colorCliente2]! + cantidadGanada;
      cliente1.fichas[colorCliente1] = cliente1.fichas[colorCliente1]! -
          cantidadApostada1 -
          cantidadApostada2;
      print(
          'El ganador es el cliente 2. Se han quitado $cantidadApostada1 fichas $colorCliente1 al cliente 1 y se han ganado $cantidadGanada fichas $colorCliente2.');
    }

    // Resumen de la ronda
    print('Resumen de la ronda $ronda:');
    print(cliente1);
    print(cliente2);
    print(miRepartidor);
    print('');

    ronda++;
  }
  // Resultados finales
  print('Resultados finales:');
  print(cliente1);
  print(cliente2);
  print(miRepartidor);
}
