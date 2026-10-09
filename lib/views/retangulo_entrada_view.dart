import 'package:flutter/material.dart';

import '../models/retangulo_model.dart';
import '../controllers/retangulo_controller.dart';
import 'retangulo_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class RetanguloEntradaView extends StatelessWidget {
  const RetanguloEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Retângulo',
      campos: const ['Base', 'Altura'],
      criarResultado: (valores) {
        final model = RetanguloModel(base: valores[0], altura: valores[1]);
        final controller = RetanguloController(model);
        return RetanguloResultadoView(controller: controller);
      },
    );
  }
}
