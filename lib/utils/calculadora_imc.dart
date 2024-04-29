import 'dart:math';
// ignore: file_names

class CalculadoraIMC {
  CalculadoraIMC(this.altura, this.peso);

  final int altura;
  final int peso;
  final double _imc = 0;

  String calcularImc() {
    // ignore: no_leading_underscores_for_local_identifiers
    double _imc = peso / pow(altura / 100, 2);
    // ignore: no_leading_underscores_for_local_identifiers
    ///double _imc = (peso / (altura * altura));

    return _imc.toStringAsFixed(1);
  }

  String obterResultado() {
    if (_imc >= 25) {
      return 'Classificação: Acima do peso';
    } else if (_imc > 18.5) {
      return 'Classificação: Normal';
    } else {
      return 'Classificação: Abaixo do peso';
    }
  }
String obterInterpretacao(){
    if (_imc >= 25) {
      return 'Você está com o peso acima do normal. Tente se exercitar mais!';
    } else if (_imc > 18.5) {
      return 'Excelente! O seu peso está normal.';
    } else {
      return 'Você está com o peso abaixo do normal. tente comer mais!';
    }
  }
}



    // switch (_imc) {
    //   case < 16:
    //     return ('Classificação: Magreza grave');
    //     break;

    //   case < 17:
    //     return 'Classificação: Magreza moderada';

    //   case < 18.5:
    //     return 'Classificação: Magreza leve';

    //   case < 25:
    //     return 'Classificação: Magreza saudável';

    //   case < 30:
    //     return 'Classificação: Sobrepeso';

    //   case < 35:
    //     return 'Classificação: Obesidade Grau I';

    //   case < 40:
    //     return 'Classificação: Obesidade Grau II';

    //   case >= 40:
    //     return 'Classificação: Obesidade Grau III';

    //   default:
    //     return'Operação inválida';
    // }