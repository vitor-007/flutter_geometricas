import 'package:flutter/material.dart';

import '../controllers/hexagono_controller.dart';
import 'widgets/geometria_resultado.dart';

class HexagonoResultadoView extends StatelessWidget {
  final HexagonoController controller;

  const HexagonoResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Hexágono regular',
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
