import 'package:flutter/material.dart';
import '../models/retangulo_model.dart';
import '../controllers/retangulo_controller.dart';
import 'retangulo_resultado_view.dart';

class RetanguloEntradaView extends StatelessWidget {
  const RetanguloEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController alturaController = TextEditingController();
    final TextEditingController baseController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Cálculo do Retângulo")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Altura:", hintText: "Entre com valor da altura."),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Base:", hintText: "Entre com valor da base."),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                double altura = double.tryParse(alturaController.text) ?? 0.0;
                double base = double.tryParse(baseController.text) ?? 0.0;
                
                RetanguloModel model = RetanguloModel(base: base, altura: altura);
                RetanguloController controller = RetanguloController(model);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RetanguloResultadoView(controller: controller)),
                );
              },
              child: const Text("Calcular", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}