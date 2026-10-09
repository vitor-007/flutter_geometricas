import 'dart:math';

import '../models/losango_model.dart';

class LosangoController {
  final LosangoModel model;
  LosangoController(this.model);
  double calcularArea() => (model.diagonalMaior * model.diagonalMenor) / 2;
  double calcularPerimetro() =>
      4 *
      sqrt(pow(model.diagonalMaior / 2, 2) + pow(model.diagonalMenor / 2, 2));
}
