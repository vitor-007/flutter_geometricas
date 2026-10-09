String formatDouble(double value, {int decimalPlaces = 2}) {
  return value.toStringAsFixed(decimalPlaces);
}

double? parseMedida(String text) {
  return double.tryParse(text.trim().replaceAll(',', '.'));
}

String? validarMedida(String? text) {
  if (text == null || text.trim().isEmpty) {
    return 'Informe uma medida.';
  }
  final value = parseMedida(text);
  if (value == null || !value.isFinite || value <= 0) {
    return 'Informe um número válido maior que zero.';
  }
  // Mantém quadrados e cubos dentro da precisão suportada pelo double.
  if (value < 1e-100 || value > 1e100) {
    return 'Medida fora do intervalo suportado (1e-100 a 1e100).';
  }
  return null;
}
