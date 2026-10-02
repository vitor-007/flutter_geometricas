import '../models/retangulo_model.dart';

class RetanguloController {
  final RetanguloModel model;

  RetanguloController(this.model);

  double calcularArea() => model.base * model.altura;
  double calcularPerimetro() => 2 * (model.base + model.altura);
}