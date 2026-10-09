import 'package:flutter/material.dart';

import '../controllers/losango_controller.dart';
import 'widgets/geometria_resultado.dart';

class LosangoResultadoView extends StatelessWidget {
  final LosangoController controller;

  const LosangoResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Losango',
      medidas: [
        MedidaResultado('Diagonal maior', controller.model.diagonalMaior),
        MedidaResultado('Diagonal menor', controller.model.diagonalMenor),
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
