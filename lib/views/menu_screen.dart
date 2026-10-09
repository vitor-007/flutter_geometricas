import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'retangulo_entrada_view.dart';
import 'quadrado_entrada_view.dart';
import 'circulo_entrada_view.dart';
import 'paralelogramo_entrada_view.dart';
import 'losango_entrada_view.dart';
import 'trapezio_entrada_view.dart';
import 'esfera_entrada_view.dart';
import 'cubo_entrada_view.dart';
import 'hexagono_entrada_view.dart';
import 'triangulo_entrada_view.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final figuras = <String, Widget>{
      'Retângulo': const RetanguloEntradaView(),
      'Quadrado': const QuadradoEntradaView(),
      'Círculo': const CirculoEntradaView(),
      'Paralelogramo': const ParalelogramoEntradaView(),
      'Losango': const LosangoEntradaView(),
      'Trapézio isósceles': const TrapezioEntradaView(),
      'Esfera': const EsferaEntradaView(),
      'Cubo': const CuboEntradaView(),
      'Hexágono regular': const HexagonoEntradaView(),
      'Triângulo isósceles': const TrianguloEntradaView(),
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Figuras Geométricas'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Sair',
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final figura in figuras.entries) ...[
                  SizedBox(
                    width: 240,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(builder: (_) => figura.value),
                      ),
                      child: Text(figura.key, textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
