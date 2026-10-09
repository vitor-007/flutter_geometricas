import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_geometrica/constants/app_constants.dart';
import 'package:flutter_geometrica/controllers/circulo_controller.dart';
import 'package:flutter_geometrica/controllers/cubo_controller.dart';
import 'package:flutter_geometrica/controllers/esfera_controller.dart';
import 'package:flutter_geometrica/controllers/hexagono_controller.dart';
import 'package:flutter_geometrica/controllers/losango_controller.dart';
import 'package:flutter_geometrica/controllers/paralelogramo_controller.dart';
import 'package:flutter_geometrica/controllers/quadrado_controller.dart';
import 'package:flutter_geometrica/controllers/retangulo_controller.dart';
import 'package:flutter_geometrica/controllers/trapezio_controller.dart';
import 'package:flutter_geometrica/controllers/triangulo_controller.dart';
import 'package:flutter_geometrica/models/circulo_model.dart';
import 'package:flutter_geometrica/models/cubo_model.dart';
import 'package:flutter_geometrica/models/esfera_model.dart';
import 'package:flutter_geometrica/models/hexagono_model.dart';
import 'package:flutter_geometrica/models/losango_model.dart';
import 'package:flutter_geometrica/models/paralelogramo_model.dart';
import 'package:flutter_geometrica/models/quadrado_model.dart';
import 'package:flutter_geometrica/models/retangulo_model.dart';
import 'package:flutter_geometrica/models/trapezio_model.dart';
import 'package:flutter_geometrica/models/triangulo_model.dart';

void main() {
  test('Retângulo 3 por 4: área 12 e perímetro 14', () {
    final c = RetanguloController(RetanguloModel(base: 3, altura: 4));
    expect(c.calcularArea(), 12);
    expect(c.calcularPerimetro(), 14);
  });
  test('Quadrado de lado 3: área 9 e perímetro 12', () {
    final c = QuadradoController(QuadradoModel(lado: 3));
    expect(c.calcularArea(), 9);
    expect(c.calcularPerimetro(), 12);
  });
  test('Círculo de diâmetro 10', () {
    final c = CirculoController(CirculoModel(diametro: 10));
    expect(c.calcularRaio(), 5);
    expect(c.calcularArea(), closeTo(78.53981634, 1e-8));
    expect(c.calcularPerimetro(), closeTo(31.41592654, 1e-8));
  });
  test('Paralelogramo usa lado e não altura no perímetro', () {
    final c = ParalelogramoController(
      ParalelogramoModel(base: 8, altura: 3, lado: 5),
    );
    expect(c.calcularArea(), 24);
    expect(c.calcularPerimetro(), 26);
  });
  test('Losango com diagonais 8 e 6: área 24 e perímetro 20', () {
    final c = LosangoController(
      LosangoModel(diagonalMaior: 8, diagonalMenor: 6),
    );
    expect(c.calcularArea(), 24);
    expect(c.calcularPerimetro(), 20);
  });
  test('Trapézio isósceles com bases 10 e 4 e altura 4', () {
    final c = TrapezioController(
      TrapezioModel(baseMaior: 10, baseMenor: 4, altura: 4),
    );
    expect(c.calcularLado(), 5);
    expect(c.calcularArea(), 28);
    expect(c.calcularPerimetro(), 24);
  });
  test('Esfera de diâmetro 6', () {
    final c = EsferaController(EsferaModel(diametro: 6));
    expect(c.calcularRaio(), 3);
    expect(c.calcularArea(), closeTo(113.09733553, 1e-8));
    expect(c.calcularVolume(), closeTo(113.09733553, 1e-8));
  });
  test('Cubo de aresta 3: área 54, soma de arestas 36 e volume 27', () {
    final c = CuboController(CuboModel(aresta: 3));
    expect(c.calcularAreaTotal(), 54);
    expect(c.calcularPerimetro(), 36);
    expect(c.calcularVolume(), 27);
  });
  test('Hexágono regular de lado 2', () {
    final c = HexagonoController(HexagonoModel(lado: 2));
    expect(c.calcularArea(), closeTo(10.39230485, 1e-8));
    expect(c.calcularPerimetro(), 12);
  });
  test('Triângulo isósceles de base 6 e altura 4: lados 5', () {
    final c = TrianguloController(TrianguloModel(base: 6, altura: 4));
    expect(c.calcularLado(), 5);
    expect(c.calcularArea(), 12);
    expect(c.calcularPerimetro(), 16);
  });
  test('Aceita ponto, vírgula e espaços externos', () {
    for (final text in ['2.5', '2,5', ' 2,5 ']) {
      expect(validarMedida(text), isNull);
      expect(parseMedida(text), 2.5);
    }
  });
  test('Rejeita medidas ausentes, inválidas e fora do intervalo', () {
    for (final text in [
      null,
      '',
      ' ',
      'abc',
      '0',
      '-1',
      'NaN',
      'Infinity',
      '1e200',
      '1e-200',
      '2,5.5',
    ]) {
      expect(validarMedida(text), isNotNull, reason: '$text');
    }
    expect(validarMedida('1e100'), isNull);
    expect(validarMedida('1e-100'), isNull);
  });
  test('Resultados usuais possuem duas casas decimais', () {
    expect(formatDouble(12), '12.00');
    expect(formatDouble(2.345), '2.35');
  });
}
