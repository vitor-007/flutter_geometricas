import 'package:flutter/material.dart';

import '../controllers/triangulo_controller.dart';
import 'widgets/geometria_resultado.dart';

class TrianguloResultadoView extends StatelessWidget {
  final TrianguloController controller;

  const TrianguloResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Triângulo isósceles',
      medidas: [
        MedidaResultado('Base', controller.model.base),
        MedidaResultado('Altura perpendicular à base', controller.model.altura),
        MedidaResultado('Cada lado igual', controller.calcularLado()),
      ],
      resultados: [
        MedidaResultado('Área', controller.calcularArea(), unidade: 'u²'),
        MedidaResultado(
          'Perímetro',
          controller.calcularPerimetro(),
          unidade: 'u',
        ),
      ],
    );
  }
}
