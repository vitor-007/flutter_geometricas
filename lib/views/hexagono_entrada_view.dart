import 'package:flutter/material.dart';

import '../models/hexagono_model.dart';
import '../controllers/hexagono_controller.dart';
import 'hexagono_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class HexagonoEntradaView extends StatelessWidget {
  const HexagonoEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Hexágono regular',
      campos: const ['Lado'],
      descricao: 'Cálculo para hexágono regular: seis lados e ângulos iguais.',
      criarResultado: (valores) {
        final model = HexagonoModel(lado: valores[0]);
        final controller = HexagonoController(model);
        return HexagonoResultadoView(controller: controller);
      },
    );
  }
}
