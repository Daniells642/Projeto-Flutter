import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:meu_app/widget/constantes.dart';
import 'package:meu_app/widget/cartaoPadrao.dart';
import 'package:meu_app/widget/conteudoIcone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Sexo {
  masculino,
  feminino,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Sexo? sexoSelecionado;
  int altura = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CALCULADORA IMC"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sexoSelecionado = Sexo.masculino;
                        });
                      },
                      child: CartaoPadrao(
                        cor: sexoSelecionado == Sexo.masculino
                            ? kCorAtivaCartaoPadrao
                            : kCorInativaCataoPadrao,
                        filhoCartao: const ConteudoIcone(
                          icone: FontAwesomeIcons.mars,
                          descricao: "MASCULINO",
                        ),
                      ),
                    ),
                  ),
                  //Text("RESPONDER", style: TextStyle(color: Color.fromARGB(255, 250, 250, 250))),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sexoSelecionado = Sexo.feminino;
                        });
                      },
                      child: CartaoPadrao(
                        cor: sexoSelecionado == Sexo.feminino
                            ? kCorAtivaCartaoPadrao
                            : kCorInativaCataoPadrao,
                        filhoCartao: const ConteudoIcone(
                          icone: FontAwesomeIcons.venus,
                          descricao: "FEMININO",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CartaoPadrao(
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ALTURA",
                      style: kDescricaoTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(altura.toString(), style: kNumeroTextStyle),
                        const Text(
                          "cm",
                          style: kDescricaoTextStyle,
                        )
                      ],
                    ),
                    Slider(
                      activeColor: kCorContainerInferior,
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double novoValor) {
                        setState(() {
                          altura = novoValor.round();
                        });
                      },
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CartaoPadrao(
                      cor: kCorAtivaCartaoPadrao,
                      filhoCartao: const Column(
                        children: [
                          //Icon(FontAwesomeIcons.mars, size: 95.0)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CartaoPadrao(
                      cor: kCorAtivaCartaoPadrao,
                      filhoCartao: const Column(
                        children: [
                          //Icon(FontAwesomeIcons.mars, size: 95.0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kCorContainerInferior,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity, //preenche toda a tela na horizontal.
              height: kAlturaContainerInferior,
            )
          ],
        ));
  }
}


  // Color corMasculinoCartaoPadrao = corInativaCataoPadrao;
  // Color corFemininoCartaoPadrao = corInativaCataoPadrao;

// //1 = masculino, 2 = feminino
//   void atualizarCor(Sexo sexoSelecionado) {
//     if (sexoSelecionado == Sexo.masculino) {
//       if (corMasculinoCartaoPadrao == corInativaCataoPadrao) {
//         corMasculinoCartaoPadrao = corAtivaCartaoPadrao;
//         corFemininoCartaoPadrao = corInativaCataoPadrao;
//       } else {
//         corMasculinoCartaoPadrao = corInativaCataoPadrao;
//       }
//     }

//     if (sexoSelecionado == Sexo.feminino) {
//       if (corFemininoCartaoPadrao == corInativaCataoPadrao) {
//         corFemininoCartaoPadrao = corAtivaCartaoPadrao;
//         corMasculinoCartaoPadrao = corInativaCataoPadrao;
//       } else {
//         corFemininoCartaoPadrao = corInativaCataoPadrao;
//       }
//     }
//   }