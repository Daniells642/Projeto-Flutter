import 'package:flutter/material.dart';
import 'package:meu_app/utils/constantes.dart';
import 'package:meu_app/widget/cartaoPadrao.dart';
import 'package:meu_app/widget/botaoInferior.dart';

class TelaResultados extends StatelessWidget {

  final String resultadoIMC;
  final String resultadoTexto;
  final String resultadoInterpretacao;
  
  const TelaResultados({super.key, required this.resultadoIMC, required this.resultadoTexto, required this.resultadoInterpretacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULADORA IMC"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Resultado",
              style: kTituloTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: CartaoPadrao(
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultadoTexto.toUpperCase(),
                      style: kResultadoTextStyle,
                    ),
                    Text(
                      resultadoIMC,
                      style: kIMCTextStyle,
                    ),
                    Text(
                      resultadoInterpretacao,
                      style: kCorpoTextStyle,
                    )
                  ],
                ),
              )),
          BotaoInferior(
            tituloBotao: "RECALCULAR",
            aoPressionar: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
