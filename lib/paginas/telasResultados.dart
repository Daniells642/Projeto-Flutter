import 'package:flutter/material.dart';
import 'package:meu_app/utils/constantes.dart';
import 'package:meu_app/widget/cartaoPadrao.dart';
import 'package:meu_app/widget/botaoInferior.dart';

class TelaResultados extends StatelessWidget {
  const TelaResultados({super.key});

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
                filhoCartao: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "NORMAL",
                      style: kResultadoTextStyle,
                    ),
                    Text(
                      "18.4",
                      style: kIMCTextStyle,
                    ),
                    Text(
                      "Seu IMC está baixo",
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
