import 'package:flutter/material.dart';

const descricaoTextStyle =
    TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w700);

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
          style: descricaoTextStyle,
        )
      ],
    );
  }
}
