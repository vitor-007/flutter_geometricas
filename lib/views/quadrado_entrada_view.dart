import 'package:flutter/material.dart';

import '../models/quadrado_model.dart';
import '../controllers/quadrado_controller.dart';
import 'quadrado_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class QuadradoEntradaView extends StatelessWidget {
  const QuadradoEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Quadrado',
      campos: const ['Lado'],
      criarResultado: (valores) {
        final model = QuadradoModel(lado: valores[0]);
        final controller = QuadradoController(model);
        return QuadradoResultadoView(controller: controller);
      },
    );
  }
}
