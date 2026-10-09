import 'package:flutter/material.dart';

import '../models/triangulo_model.dart';
import '../controllers/triangulo_controller.dart';
import 'triangulo_resultado_view.dart';
import 'widgets/geometria_entrada_form.dart';

class TrianguloEntradaView extends StatelessWidget {
  const TrianguloEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    return GeometriaEntradaForm(
      titulo: 'Cálculo — Triângulo isósceles',
      campos: const ['Base', 'Altura perpendicular à base'],
      descricao:
          'Cálculo para triângulo isósceles: os dois lados iguais são calculados pela base e altura.',
      criarResultado: (valores) {
        final model = TrianguloModel(base: valores[0], altura: valores[1]);
        final controller = TrianguloController(model);
        return TrianguloResultadoView(controller: controller);
      },
    );
  }
}
