import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_geometrica/main.dart';
import 'package:flutter_geometrica/views/login_screen.dart';
import 'package:flutter_geometrica/views/menu_screen.dart';
import 'package:flutter_geometrica/views/splash_screen.dart';
import 'package:flutter_geometrica/views/widgets/geometria_entrada_form.dart';
import 'package:flutter_geometrica/views/widgets/geometria_resultado.dart';

Future<void> preencher(WidgetTester tester, List<String> valores) async {
  for (var i = 0; i < valores.length; i++) {
    final campo = find.byKey(ValueKey('medida_$i'));
    await tester.ensureVisible(campo);
    await tester.pumpAndSettle();
    await tester.enterText(campo, valores[i]);
    await tester.pumpAndSettle();
  }
  final calcular = find.widgetWithText(ElevatedButton, 'Calcular');
  await tester.ensureVisible(calcular);
  await tester.pumpAndSettle();
  await tester.tap(calcular);
  await tester.pumpAndSettle();
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  final casos = <String, List<String>>{
    'Retângulo': ['3', '4'],
    'Quadrado': ['3'],
    'Círculo': ['10'],
    'Paralelogramo': ['8', '3', '5'],
    'Losango': ['8', '6'],
    'Trapézio isósceles': ['10', '4', '4'],
    'Esfera': ['6'],
    'Cubo': ['3'],
    'Hexágono regular': ['2'],
    'Triângulo isósceles': ['6', '4'],
  };
  final resultados = <String, List<String>>{
    'Retângulo': ['Área:\n12.00 u²', 'Perímetro:\n14.00 u'],
    'Quadrado': ['Área:\n9.00 u²', 'Perímetro:\n12.00 u'],
    'Círculo': ['Área:\n78.54 u²', 'Perímetro:\n31.42 u'],
    'Paralelogramo': ['Área:\n24.00 u²', 'Perímetro:\n26.00 u'],
    'Losango': ['Área:\n24.00 u²', 'Perímetro:\n20.00 u'],
    'Trapézio isósceles': ['Área:\n28.00 u²', 'Perímetro:\n24.00 u'],
    'Esfera': ['Área da superfície:\n113.10 u²', 'Volume:\n113.10 u³'],
    'Cubo': [
      'Área total:\n54.00 u²',
      'Soma das arestas:\n36.00 u',
      'Volume:\n27.00 u³',
    ],
    'Hexágono regular': ['Área:\n10.39 u²', 'Perímetro:\n12.00 u'],
    'Triângulo isósceles': ['Área:\n12.00 u²', 'Perímetro:\n16.00 u'],
  };

  for (final caso in casos.entries) {
    testWidgets('${caso.key}: menu, cálculo e retorno preservam medidas', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MenuScreen()));
      final botao = find.widgetWithText(ElevatedButton, caso.key);
      await tester.ensureVisible(botao);
      await tester.tap(botao);
      await tester.pumpAndSettle();
      expect(find.byType(GeometriaEntradaForm), findsOneWidget);
      await preencher(tester, caso.value);
      expect(find.byType(GeometriaResultado), findsOneWidget);
      for (final resultado in resultados[caso.key]!) {
        expect(find.text(resultado), findsOneWidget);
      }
      final voltar = find.widgetWithText(
        ElevatedButton,
        'Voltar e editar medidas',
      );
      await tester.ensureVisible(voltar);
      await tester.tap(voltar);
      await tester.pumpAndSettle();
      for (var i = 0; i < caso.value.length; i++) {
        final field = tester.widget<TextFormField>(
          find.byKey(ValueKey('medida_$i')),
        );
        expect(field.controller!.text, caso.value[i]);
      }
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Login exige campos preenchidos e permite sair', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await tester.tap(find.text('Entrar'));
    await tester.pump();
    expect(find.text('Preencha este campo.'), findsNWidgets(2));
    await tester.enterText(find.byType(TextFormField).at(0), '   ');
    await tester.enterText(find.byType(TextFormField).at(1), '   ');
    await tester.tap(find.text('Entrar'));
    await tester.pump();
    expect(find.byType(MenuScreen), findsNothing);
    await tester.enterText(find.byType(TextFormField).at(0), 'Vitor');
    await tester.enterText(find.byType(TextFormField).at(1), '123');
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    expect(find.byType(MenuScreen), findsOneWidget);
    await tester.tap(find.byTooltip('Sair'));
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Formulário impede entradas inválidas e aceita vírgula', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: MenuScreen()));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Quadrado'));
    await tester.pumpAndSettle();
    for (final text in ['', 'abc', '0', '-1', 'NaN', 'Infinity']) {
      await preencher(tester, [text]);
      expect(find.byType(GeometriaResultado), findsNothing);
      expect(find.byType(GeometriaEntradaForm), findsOneWidget);
    }
    await preencher(tester, ['2,5']);
    expect(find.text('Área:\n6.25 u²'), findsOneWidget);
    expect(find.text('Perímetro:\n10.00 u'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  final invalidos = <String, List<String>>{
    'Paralelogramo': ['8', '6', '5'],
    'Losango': ['6', '8'],
    'Trapézio isósceles': ['4', '10', '4'],
  };
  for (final caso in invalidos.entries) {
    testWidgets('${caso.key}: impede medidas incompatíveis', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MenuScreen()));
      final botao = find.widgetWithText(ElevatedButton, caso.key);
      await tester.ensureVisible(botao);
      await tester.tap(botao);
      await tester.pumpAndSettle();
      await preencher(tester, caso.value);
      expect(find.byType(GeometriaResultado), findsNothing);
      expect(
        find.textContaining('deve ser').evaluate().isNotEmpty ||
            find.textContaining('não pode').evaluate().isNotEmpty,
        isTrue,
      );
      await preencher(tester, casos[caso.key]!);
      expect(find.byType(GeometriaResultado), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Splash carrega os logotipos e abre login após três segundos', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    expect(find.byType(Image), findsNWidgets(3));
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(SplashScreen), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'Remover Splash antes do timer não navega com contexto descartado',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      await tester.pump(const Duration(seconds: 4));
      expect(find.byType(LoginScreen), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('Tela pequena e teclado aberto permitem calcular e voltar', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    tester.view.viewInsets = const FakeViewPadding(bottom: 240);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpWidget(const MaterialApp(home: MenuScreen()));
    final botao = find.widgetWithText(ElevatedButton, 'Paralelogramo');
    await tester.ensureVisible(botao);
    await tester.tap(botao);
    await tester.pumpAndSettle();
    await preencher(tester, ['8', '3', '5']);
    expect(find.text('Área:\n24.00 u²'), findsOneWidget);
    final voltar = find.text('Voltar e editar medidas');
    await tester.ensureVisible(voltar);
    await tester.tap(voltar);
    await tester.pumpAndSettle();
    expect(find.byType(GeometriaEntradaForm), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
