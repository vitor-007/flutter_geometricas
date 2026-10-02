import 'dart:math';
import '../models/cubo_model.dart';
class CuboController {
  final CuboModel model;
  CuboController(this.model);
  double calcularAreaTotal() => 6 * pow(model.aresta, 2);
  double calcularPerimetro() => 12 * model.aresta;
}