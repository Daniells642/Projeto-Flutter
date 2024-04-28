import 'package:flutter/material.dart';
import 'package:meu_app/utils/constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior(
      {super.key, this.aoPressionar, required this.tituloBotao});

  final Function()? aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        aoPressionar;
      },
      child: Container(
        alignment: Alignment.center,
        color: kCorContainerInferior,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity, //preenche toda a tela na horizontal.
        height: kAlturaContainerInferior,
        child: Text(
          tituloBotao,
          style: kBotaoGrande,
        ),
      ),
    );
  }
}