import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:meu_app/widget/cartaoPadrao.dart';
import 'package:meu_app/widget/conteudoIcone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Sexo {
  masculino,
  feminino,
}

const alturaContainerInferior = 80.0;
const corAtivaCartaoPadrao = Color(0xFF9E9E9E);
const corInativaCataoPadrao = Color.fromARGB(255, 54, 54, 54);
const corContainerInferior = Color(0xFFFF5822);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Sexo ?sexoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CALCULADORA IMC"),
          centerTitle: true,
        ),
        body: Column(
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
                            ? corAtivaCartaoPadrao
                            : corInativaCataoPadrao,
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
                            ? corAtivaCartaoPadrao
                            : corInativaCataoPadrao,
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
                cor: corAtivaCartaoPadrao,
               
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CartaoPadrao(
                      cor: corAtivaCartaoPadrao, 
                      filhoCartao: const Column(
                        children: [
                          //Icon(FontAwesomeIcons.mars, size: 95.0)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CartaoPadrao(
                      cor: corAtivaCartaoPadrao,
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
              color: corContainerInferior,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity, //preenche toda a tela na horizontal.
              height: alturaContainerInferior,
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