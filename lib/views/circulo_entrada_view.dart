import 'package:flutter/material.dart';

import '../models/circulo_model.dart';
import '../controllers/circulo_controller.dart';
import 'circulo_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class CirculoEntradaView extends StatelessWidget {
  const CirculoEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Círculo',
      campos: const ['Diâmetro'],
      criarResultado: (valores) {
        final model = CirculoModel(diametro: valores[0]);
        final controller = CirculoController(model);
        return CirculoResultadoView(controller: controller);
      },
    );
  }
}
