import 'package:flutter/material.dart';

import '../models/cubo_model.dart';
import '../controllers/cubo_controller.dart';
import 'cubo_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class CuboEntradaView extends StatelessWidget {
  const CuboEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Cubo',
      campos: const ['Aresta'],
      criarResultado: (valores) {
        final model = CuboModel(aresta: valores[0]);
        final controller = CuboController(model);
        return CuboResultadoView(controller: controller);
      },
    );
  }
}
