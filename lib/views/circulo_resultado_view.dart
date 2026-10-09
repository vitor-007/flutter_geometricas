import 'package:flutter/material.dart';

import '../controllers/circulo_controller.dart';
import 'widgets/geometria_resultado.dart';

class CirculoResultadoView extends StatelessWidget {
  final CirculoController controller;

  const CirculoResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Círculo',
      medidas: [
        MedidaResultado('Diâmetro', controller.model.diametro),
        MedidaResultado('Raio', controller.calcularRaio()),
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
