import 'package:flutter/material.dart';
import '../controllers/retangulo_controller.dart';
import '../constants/app_constants.dart';

class RetanguloResultadoView extends StatelessWidget {
  final RetanguloController controller;

  const RetanguloResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultados Finais")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Altura: ${formatDouble(controller.model.altura)}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Base: ${formatDouble(controller.model.base)}", style: const TextStyle(fontSize: 18)),
            const Divider(height: 30, thickness: 2),
            Text("Área:\n${formatDouble(controller.calcularArea())}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Perímetro:\n${formatDouble(controller.calcularPerimetro())}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}