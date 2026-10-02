import '../models/triangulo_model.dart';
class TrianguloController {
  final TrianguloModel model;
  TrianguloController(this.model);
  double calcularArea() => (model.base * model.altura) / 2;
  double calcularPerimetro() => model.base + (2 * model.lado);
}