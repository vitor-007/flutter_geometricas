import '../models/quadrado_model.dart';
class QuadradoController {
  final QuadradoModel model;
  QuadradoController(this.model);
  double calcularArea() => model.lado * model.lado;
  double calcularPerimetro() => 4 * model.lado;
}