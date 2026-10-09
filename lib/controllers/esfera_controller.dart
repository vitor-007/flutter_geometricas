import 'dart:math';

import '../models/esfera_model.dart';

class EsferaController {
  final EsferaModel model;
  EsferaController(this.model);
  double calcularRaio() => model.diametro / 2;
  double calcularArea() => 4 * pi * pow(calcularRaio(), 2);
  double calcularVolume() => (4 / 3) * pi * pow(calcularRaio(), 3);
}
