import 'package:flutter/material.dart';

import '../controllers/esfera_controller.dart';
import 'widgets/geometria_resultado.dart';

class EsferaResultadoView extends StatelessWidget {
  final EsferaController controller;

  const EsferaResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Esfera',
      medidas: [
        MedidaResultado('Diâmetro', controller.model.diametro),
        MedidaResultado('Raio', controller.calcularRaio()),
      ],
      resultados: [
        MedidaResultado(
          'Área da superfície',
          controller.calcularArea(),
          unidade: 'u²',
        ),
        MedidaResultado('Volume', controller.calcularVolume(), unidade: 'u³'),
      ],
    );
  }
}
