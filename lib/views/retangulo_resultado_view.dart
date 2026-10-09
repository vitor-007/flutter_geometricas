import 'package:flutter/material.dart';

import '../controllers/retangulo_controller.dart';
import 'widgets/geometria_resultado.dart';

class RetanguloResultadoView extends StatelessWidget {
  final RetanguloController controller;

  const RetanguloResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Retângulo',
      medidas: [
        MedidaResultado('Base', controller.model.base),
        MedidaResultado('Altura', controller.model.altura),
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
