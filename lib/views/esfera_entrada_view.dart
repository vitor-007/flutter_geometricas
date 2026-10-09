import 'package:flutter/material.dart';

import '../models/esfera_model.dart';
import '../controllers/esfera_controller.dart';
import 'esfera_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class EsferaEntradaView extends StatelessWidget {
  const EsferaEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Esfera',
      campos: const ['Diâmetro'],
      criarResultado: (valores) {
        final model = EsferaModel(diametro: valores[0]);
        final controller = EsferaController(model);
        return EsferaResultadoView(controller: controller);
      },
    );
  }
}
