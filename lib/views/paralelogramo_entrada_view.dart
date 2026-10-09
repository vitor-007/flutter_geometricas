import 'package:flutter/material.dart';

import '../models/paralelogramo_model.dart';
import '../controllers/paralelogramo_controller.dart';
import 'paralelogramo_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class ParalelogramoEntradaView extends StatelessWidget {
  const ParalelogramoEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Paralelogramo',
      campos: const ['Base', 'Altura perpendicular à base', 'Lado inclinado'],
      descricao:
          'A altura é perpendicular à base e pode ser diferente do lado.',
      validarFigura: (valores) => valores[1] > valores[2]
          ? 'A altura não pode ser maior que o lado inclinado.'
          : null,
      criarResultado: (valores) {
        final model = ParalelogramoModel(
          base: valores[0],
          altura: valores[1],
          lado: valores[2],
        );
        final controller = ParalelogramoController(model);
        return ParalelogramoResultadoView(controller: controller);
      },
    );
  }
}
