import 'package:flutter/material.dart';
import 'package:meu_app/utils/constantes.dart';

class ConteudoIcone extends StatelessWidget {
  const ConteudoIcone(
      {super.key, required this.icone, required this.descricao});

  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, size: 70.0),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          descricao,
          style: kDescricaoTextStyle,
        )
      ],
    );
  }
}
