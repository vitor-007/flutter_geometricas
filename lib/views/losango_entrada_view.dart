import 'package:flutter/material.dart';

import '../models/losango_model.dart';
import '../controllers/losango_controller.dart';
import 'losango_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class LosangoEntradaView extends StatelessWidget {
  const LosangoEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Losango',
      campos: const ['Diagonal maior', 'Diagonal menor'],
      validarFigura: (valores) => valores[0] < valores[1]
          ? 'A diagonal maior deve ser maior ou igual à diagonal menor.'
          : null,
      criarResultado: (valores) {
        final model = LosangoModel(
          diagonalMaior: valores[0],
          diagonalMenor: valores[1],
        );
        final controller = LosangoController(model);
        return LosangoResultadoView(controller: controller);
      },
    );
  }
}
