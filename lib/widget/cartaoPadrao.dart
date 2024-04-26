import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({required this.cor, this.filhoCartao});

  final Color cor;
  final Widget ?filhoCartao;
  //final Function() ?aoPressionar;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0)),
      child: filhoCartao,
    );
  }
}