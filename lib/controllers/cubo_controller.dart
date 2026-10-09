import '../models/cubo_model.dart';

class CuboController {
  final CuboModel model;
  CuboController(this.model);

  double calcularAreaTotal() => 6 * model.aresta * model.aresta;
  // O cubo não tem perímetro plano: este valor é a soma das 12 arestas.
  double calcularPerimetro() => 12 * model.aresta;
  double calcularVolume() => model.aresta * model.aresta * model.aresta;
}
