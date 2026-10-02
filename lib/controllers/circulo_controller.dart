import 'dart:math';
import '../models/circulo_model.dart';

class CirculoController {
  final CirculoModel model;

  CirculoController(this.model);

  double calcularRaio() => model.diametro / 2;
  double calcularArea() => pi * pow(calcularRaio(), 2);
  double calcularPerimetro() => 2 * pi * calcularRaio();
}