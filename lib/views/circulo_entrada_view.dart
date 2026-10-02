import 'package:flutter/material.dart';
import '../models/circulo_model.dart';
import '../controllers/circulo_controller.dart';
import 'circulo_resultado_view.dart';

class CirculoEntradaView extends StatelessWidget {
  const CirculoEntradaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController diametroController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Cálculo do Círculo")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: diametroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Diâmetro:", hintText: "Entre com valor do diâmetro."),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                double diametro = double.tryParse(diametroController.text) ?? 0.0;
                
                CirculoModel model = CirculoModel(diametro: diametro);
                CirculoController controller = CirculoController(model);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CirculoResultadoView(controller: controller)),
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