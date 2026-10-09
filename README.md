# Figuras Geométricas — Flutter MVC

Aplicativo acadêmico de Vitor Reina, com apresentação, login local, menu e telas
para calcular dez figuras. O login permite entrar com usuário e senha preenchidos;
não há autenticação em servidor nem cadastro de contas.

## Executar no Android

Instale o Flutter no canal stable e configure um emulador Android ou celular com
depuração USB. Na pasta do projeto:

```bash
flutter clean
flutter pub get
flutter analyze
flutter test
flutter run
```

Se você já clonou o repositório, atualize com `git pull --ff-only` antes de executar.
Caso tenha alterações locais, salve-as em um commit ou faça uma cópia antes do pull.
Não é necessário editar os arquivos manualmente.

## Organização MVC

- `lib/models`: medidas de cada figura.
- `lib/controllers`: fórmulas matemáticas.
- `lib/views`: telas de entrada, resultado e navegação.
- `lib/views/widgets`: formulário validado e layout de resultados compartilhados.
- `lib/constants`: formatação e validação de medidas.
- `assets/images`: logotipos da apresentação.
- `test`: testes de fórmulas, validação, navegação e ciclo de vida.

## Figuras e hipóteses

| Figura | Entrada | Resultados |
| --- | --- | --- |
| Retângulo | Base e altura | Área e perímetro |
| Quadrado | Lado | Área e perímetro |
| Círculo | Diâmetro | Raio, área e perímetro |
| Paralelogramo | Base, altura perpendicular e lado inclinado | Área e perímetro |
| Losango | Diagonal maior e menor | Área e perímetro |
| Trapézio isósceles | Base maior, base menor e altura | Lado, área e perímetro |
| Esfera | Diâmetro | Raio, área da superfície e volume |
| Cubo | Aresta | Área total, soma das 12 arestas e volume |
| Hexágono regular | Lado | Área e perímetro |
| Triângulo isósceles | Base e altura | Lados iguais, área e perímetro |

O triângulo calcula seus dois lados iguais a partir da base e da altura, evitando
medidas incompatíveis. O trapézio pressupõe lados não paralelos iguais. O hexágono
pressupõe seis lados e ângulos iguais. Não são cálculos para figuras irregulares.

Todas as medidas devem usar a mesma unidade. As entradas aceitam vírgula ou ponto
como separador decimal e rejeitam campos vazios, texto, zero, números negativos e
valores não finitos. Para evitar overflow/underflow nos cálculos com `double`, o
intervalo suportado de cada medida é de `1e-100` até `1e100`. O paralelogramo não
aceita altura maior que o lado; o losango verifica a ordem das diagonais; o
trapézio exige base maior estritamente maior que a base menor.

Os resultados usam duas casas decimais, com `u` para comprimento, `u²` para área
e `u³` para volume. Ao voltar do resultado, as medidas digitadas são preservadas.

## Validação executada

Verificado com Flutter 3.47.7 stable e Dart 3.13.5:

- `flutter analyze`: nenhum problema encontrado.
- `flutter test`: 31 testes passaram (fórmulas e fluxos das telas).

## Teste manual

1. Confira os três logotipos e a passagem para o login após três segundos.
2. Tente entrar sem preencher os campos e depois com usuário/senha preenchidos.
3. Abra cada figura, digite medidas e confira o resultado; volte e edite as medidas.
4. Experimente `2,5`, um campo vazio, `abc`, `0` e `-1`.
5. Teste com o teclado aberto e em uma tela pequena; as telas permitem rolagem.
6. Use **Sair** para retornar ao login.

## Gerar APK ou arquivo de entrega

```bash
flutter build apk --debug
```

O APK fica em `build/app/outputs/flutter-apk/app-debug.apk`. Para entregar o código,
compacte a pasta sem `.git`, `.dart_tool` e `build`. Inclua `lib`, `assets`, `android`,
`test`, `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml` e este README.
O projeto está configurado para Android; as outras plataformas não estão incluídas.
