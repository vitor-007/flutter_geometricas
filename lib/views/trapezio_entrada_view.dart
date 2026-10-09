import 'package:flutter/material.dart';

import '../models/trapezio_model.dart';
import '../controllers/trapezio_controller.dart';
import 'trapezio_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class TrapezioEntradaView extends StatelessWidget {
  const TrapezioEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Trapézio isósceles',
      campos: const ['Base maior', 'Base menor', 'Altura'],
      descricao:
          'Cálculo para trapézio isósceles: os dois lados não paralelos são iguais.',
      validarFigura: (valores) => valores[0] <= valores[1]
          ? 'A base maior deve ser maior que a base menor.'
          : null,
      criarResultado: (valores) {
        final model = TrapezioModel(
          baseMaior: valores[0],
          baseMenor: valores[1],
          altura: valores[2],
        );
        final controller = TrapezioController(model);
        return TrapezioResultadoView(controller: controller);
      },
    );
  }
}
