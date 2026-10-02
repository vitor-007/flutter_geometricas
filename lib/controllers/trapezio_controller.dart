import 'dart:math';
import '../models/trapezio_model.dart';
class TrapezioController {
  final TrapezioModel model;
  TrapezioController(this.model);
  double calcularArea() => ((model.baseMaior + model.baseMenor) * model.altura) / 2;
  double calcularPerimetro() => model.baseMaior + model.baseMenor + 2 * sqrt(pow(model.altura, 2) + pow((model.baseMaior - model.baseMenor) / 2, 2));
}