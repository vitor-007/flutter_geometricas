import 'dart:math';
import '../models/hexagono_model.dart';
class HexagonoController {
  final HexagonoModel model;
  HexagonoController(this.model);
  double calcularArea() => (3 * sqrt(3) * pow(model.lado, 2)) / 2;
  double calcularPerimetro() => 6 * model.lado;
}