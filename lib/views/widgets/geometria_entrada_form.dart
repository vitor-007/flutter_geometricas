import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class GeometriaEntradaForm extends StatefulWidget {
  final String titulo;
  final List<String> campos;
  final String? descricao;
  final String? Function(List<double>)? validarFigura;
  final Widget Function(List<double>) criarResultado;

  const GeometriaEntradaForm({
    super.key,
    required this.titulo,
    required this.campos,
    required this.criarResultado,
    this.descricao,
    this.validarFigura,
  });

  @override
  State<GeometriaEntradaForm> createState() => _GeometriaEntradaFormState();
}

class _GeometriaEntradaFormState extends State<GeometriaEntradaForm> {
  final _formKey = GlobalKey<FormState>();
  late final List<TextEditingController> _controllers;
  String? _erroFigura;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.campos.length,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _calcular() {
    setState(() => _erroFigura = null);
    if (!_formKey.currentState!.validate()) return;
    final valores = _controllers.map((c) => parseMedida(c.text)!).toList();
    final erro = widget.validarFigura?.call(valores);
    if (erro != null) {
      setState(() => _erroFigura = erro);
      return;
    }
    FocusScope.of(context).unfocus();
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => widget.criarResultado(valores)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo)),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.descricao != null) ...[
                      Text(widget.descricao!),
                      const SizedBox(height: 20),
                    ],
                    const Text('Use a mesma unidade para todas as medidas.'),
                    const SizedBox(height: 20),
                    for (var i = 0; i < widget.campos.length; i++) ...[
                      TextFormField(
                        key: ValueKey('medida_$i'),
                        controller: _controllers[i],
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textInputAction: i == widget.campos.length - 1
                            ? TextInputAction.done
                            : TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: widget.campos[i],
                          hintText: 'Ex.: 5 ou 5,5',
                          border: const OutlineInputBorder(),
                        ),
                        validator: validarMedida,
                        onChanged: (_) {
                          if (_erroFigura != null) {
                            setState(() => _erroFigura = null);
                          }
                        },
                        onFieldSubmitted: (_) {
                          if (i == widget.campos.length - 1) _calcular();
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                    if (_erroFigura != null) ...[
                      Text(
                        _erroFigura!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: _calcular,
                      child: const Text('Calcular'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
