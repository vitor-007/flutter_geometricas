import 'package:flutter/material.dart';

import '../controllers/paralelogramo_controller.dart';
import 'widgets/geometria_resultado.dart';

class ParalelogramoResultadoView extends StatelessWidget {
  final ParalelogramoController controller;

  const ParalelogramoResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Paralelogramo',
      medidas: [
        MedidaResultado('Base', controller.model.base),
        MedidaResultado('Altura perpendicular à base', controller.model.altura),
        MedidaResultado('Lado inclinado', controller.model.lado),
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
