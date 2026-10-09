import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class MedidaResultado {
  final String nome;
  final double valor;
  final String unidade;

  const MedidaResultado(this.nome, this.valor, {this.unidade = 'u'});
}

class GeometriaResultado extends StatelessWidget {
  final String figura;
  final List<MedidaResultado> medidas;
  final List<MedidaResultado> resultados;

  const GeometriaResultado({
    super.key,
    required this.figura,
    required this.medidas,
    required this.resultados,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultados — $figura')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final medida in medidas) ...[
                Text(
                  '${medida.nome}: ${formatDouble(medida.valor)} ${medida.unidade}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
              ],
              const Divider(height: 30, thickness: 2),
              for (final resultado in resultados) ...[
                Text(
                  '${resultado.nome}:\n${formatDouble(resultado.valor)} ${resultado.unidade}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
              const Text('u = unidade de medida; u² = área; u³ = volume.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar e editar medidas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
