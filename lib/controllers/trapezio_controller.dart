import 'dart:math';

import '../models/trapezio_model.dart';

// As fórmulas dos lados e do perímetro pressupõem trapézio isósceles.
class TrapezioController {
  final TrapezioModel model;
  TrapezioController(this.model);

  double calcularArea() =>
      ((model.baseMaior + model.baseMenor) * model.altura) / 2;
  double calcularLado() => sqrt(
        pow(model.altura, 2) + pow((model.baseMaior - model.baseMenor) / 2, 2),
      );
  double calcularPerimetro() =>
      model.baseMaior + model.baseMenor + 2 * calcularLado();
}
