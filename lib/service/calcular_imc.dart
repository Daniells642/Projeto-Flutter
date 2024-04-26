import 'package:flutter/material.dart';
import 'package:meu_app/widget/widget.dart';

class CalculoImc extends StatefulWidget {
  const CalculoImc({super.key});

  @override
  State<CalculoImc> createState() => _CalculoImcState();

  calculateImc() {}
}

class _CalculoImcState extends State<CalculoImc> {
  late String _result;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }



  String calculateImc() {
    double weight = double.parse(WidgetClass().weightController.text);
    double height = double.parse(WidgetClass().heightController.text) / 100.0;
    double imc = weight / (height * height);

    setState(() {
       _result = "IMC = ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6)
        _result += "Abaixo do peso";
      else if (imc < 25.0)
        _result += "Peso ideal";
      else if (imc < 30.0)
        _result += "Levemente acima do peso";
      else if (imc < 35.0)
        _result += "Obesidade Grau I";
      else if (imc < 40.0)
        _result += "Obesidade Grau II";
      else
        _result += "Obesidade Grau IIII";
    });
    return _result.toString();
    
  }
}