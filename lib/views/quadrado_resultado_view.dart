import 'package:flutter/material.dart';

import '../controllers/quadrado_controller.dart';
import 'widgets/geometria_resultado.dart';

class QuadradoResultadoView extends StatelessWidget {
  final QuadradoController controller;

  const QuadradoResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Quadrado',
      medidas: [MedidaResultado('Lado', controller.model.lado)],
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
