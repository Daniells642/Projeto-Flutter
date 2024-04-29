import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meu_app/utils/constantes.dart';
import 'package:meu_app/widget/cartaoPadrao.dart';
import 'package:meu_app/widget/botaoInferior.dart';
import 'package:meu_app/widget/conteudoIcone.dart';
import 'package:meu_app/utils/calculadora_IMC.dart';
import 'package:meu_app/widget/botaoArredondado.dart';
import 'package:meu_app/paginas/telasResultados.dart';
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
  int altura = 170;
  int peso = 60;
  int idade = 18;

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
                    child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          sexoSelecionado = Sexo.masculino;
                          //print("HOMEM");
                        });
                      },
                      cor: sexoSelecionado == Sexo.masculino
                          ? kCorAtivaCartaoPadrao
                          : kCorInativaCataoPadrao,
                      filhoCartao: const ConteudoIcone(
                        icone: FontAwesomeIcons.mars,
                        descricao: "MASCULINO",
                      ),
                    ),
                  ),
                  //Text("RESPONDER", style: TextStyle(color: Color.fromARGB(255, 250, 250, 250))),
                  Expanded(
                    child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          sexoSelecionado = Sexo.feminino;
                          //print("está funçando");
                        });
                      },
                      cor: sexoSelecionado == Sexo.feminino
                          ? kCorAtivaCartaoPadrao
                          : kCorInativaCataoPadrao,
                      filhoCartao: const ConteudoIcone(
                        icone: FontAwesomeIcons.venus,
                        descricao: "FEMININO",
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
                      filhoCartao: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'PESO',
                            style: kDescricaoTextStyle,
                          ),
                          Text(
                            peso.toString(),
                            style: kNumeroTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotaoArredondado(
                                icone: FontAwesomeIcons.minus,
                                aoPressionar: () {
                                  setState(() {
                                    peso--;

                                    if (peso < 0) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Informe um peso válido.")));
                                      peso++;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              BotaoArredondado(
                                icone: FontAwesomeIcons.plus,
                                aoPressionar: () {
                                  setState(() {
                                    peso++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CartaoPadrao(
                      cor: kCorAtivaCartaoPadrao,
                      filhoCartao: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'IDADE',
                            style: kDescricaoTextStyle,
                          ),
                          Text(
                            idade.toString(),
                            style: kNumeroTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotaoArredondado(
                                icone: FontAwesomeIcons.minus,
                                aoPressionar: () {
                                  setState(() {
                                    idade--;

                                    if (idade < 10) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Informe uma idade maior que 10.")));
                                      idade++;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              BotaoArredondado(
                                icone: FontAwesomeIcons.plus,
                                aoPressionar: () {
                                  setState(() {
                                    idade++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BotaoInferior(
              tituloBotao: "CALCULAR",
              aoPressionar: () {
                CalculadoraIMC calc = CalculadoraIMC(altura, peso);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaResultados(
                              resultadoIMC: calc.calcularImc(),
                              resultadoTexto: calc.obterResultado(), 
                              resultadoInterpretacao: calc.obterInterpretacao(),
                            )));
              },
            ),
          ],
        ));
  }
}

                          //Icon(FontAwesomeIcons.mars, size: 95.0)

                          // FloatingActionButton(
                          //   backgroundColor: const Color(0xFF7E7E7E),
                          //   onPressed: () {},

                          // const Icon(
                          //   Icons.add,
                          //   color: Colors.white,
                          // ),
// Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const TelaResultados()));


// Ainda não consegui usar a "Function final Function ?aoPressionar;"


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
