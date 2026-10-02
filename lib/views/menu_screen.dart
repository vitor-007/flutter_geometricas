import 'package:flutter/material.dart';
import 'retangulo_entrada_view.dart';
import 'circulo_entrada_view.dart';
import 'quadrado_entrada_view.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Figuras Geométricas"), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuButton(context, "Retângulo", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RetanguloEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Quadrado", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const QuadradoEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Círculo", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CirculoEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Paralelogramo", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ParalelogramoEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Losango", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LosangoEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Trapézio", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TrapezioEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Esfera", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EsferaEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Cubo", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CuboEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Hexágono", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HexagonoEntradaView()))),
              const SizedBox(height: 10),
              _buildMenuButton(context, "Triângulo", () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TrianguloEntradaView()))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String titulo, VoidCallback onPressed) {
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: onPressed,
        child: Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}