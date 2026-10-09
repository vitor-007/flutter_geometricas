import 'package:flutter/material.dart';

import '../controllers/trapezio_controller.dart';
import 'widgets/geometria_resultado.dart';

class TrapezioResultadoView extends StatelessWidget {
  final TrapezioController controller;

  const TrapezioResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Trapézio isósceles',
      medidas: [
        MedidaResultado('Base maior', controller.model.baseMaior),
        MedidaResultado('Base menor', controller.model.baseMenor),
        MedidaResultado('Altura', controller.model.altura),
        MedidaResultado('Cada lado não paralelo', controller.calcularLado()),
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
