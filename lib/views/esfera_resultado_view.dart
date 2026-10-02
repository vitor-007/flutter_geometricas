import 'package:flutter/material.dart';
import '../controllers/esfera_controller.dart';
import '../constants/app_constants.dart';

class EsferaResultadoView extends StatelessWidget {
  final EsferaController controller;

  const EsferaResultadoView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultados Finais")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Diâmetro: ${formatDouble(controller.model.diametro)}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Raio: ${formatDouble(controller.calcularRaio())}", style: const TextStyle(fontSize: 18)),
            const Divider(height: 30, thickness: 2),
            Text("Área:\n${formatDouble(controller.calcularArea())}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("Volume:\n${formatDouble(controller.calcularVolume())}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}