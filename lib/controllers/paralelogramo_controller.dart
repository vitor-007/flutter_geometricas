import '../models/paralelogramo_model.dart';
class ParalelogramoController {
  final ParalelogramoModel model;
  ParalelogramoController(this.model);
  double calcularArea() => model.base * model.altura;
  double calcularPerimetro() => 2 * (model.base + model.altura);
}