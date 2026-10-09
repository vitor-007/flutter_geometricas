import 'package:flutter/material.dart';

import '../controllers/cubo_controller.dart';
import 'widgets/geometria_resultado.dart';

class CuboResultadoView extends StatelessWidget {
  final CuboController controller;

  const CuboResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GeometriaResultado(
      figura: 'Cubo',
      medidas: [MedidaResultado('Aresta', controller.model.aresta)],
      resultados: [
        MedidaResultado(
          'Área total',
          controller.calcularAreaTotal(),
          unidade: 'u²',
        ),
        MedidaResultado(
          'Soma das arestas',
          controller.calcularPerimetro(),
          unidade: 'u',
        ),
        MedidaResultado('Volume', controller.calcularVolume(), unidade: 'u³'),
      ],
    );
  }
}
