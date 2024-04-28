import 'package:flutter/material.dart';
import 'package:meu_app/paginas/homePage.dart';
import 'package:meu_app/paginas/telasResultados.dart';

void main() => runApp(const CalculadoraImc());

class CalculadoraImc extends StatelessWidget {
  const CalculadoraImc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      //home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/telaResultados': (context) => const TelaResultados(),
      },
    );
  }
}
