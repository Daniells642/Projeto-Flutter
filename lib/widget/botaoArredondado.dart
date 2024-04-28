import 'package:flutter/material.dart';

class BotaoArredondado extends StatelessWidget {
  const BotaoArredondado({super.key, this.icone, this.aoPressionar});

  final IconData? icone;
  final Function()? aoPressionar;

  // void aoPressionar(){

  // }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: aoPressionar,
      elevation: 5.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF7E7E7E),
      child: Icon(icone),
    );
  }
}