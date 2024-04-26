import 'package:flutter/material.dart';
import 'package:meu_app/service/calcular_Imc.dart';

class WidgetClass {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  //late String _resultado;

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Calculadora de IMC',
          style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white, size: 30),
          onPressed: () {
            //resetFields();
          },
        )
      ],
    );
  }

  Form buildForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          tituloForm(),

          buildTextFormField(
              label: "Peso (kg)",
              error: "Insira seu peso!",
              controller: weightController),
          buildTextFormField(
              label: "Altura (cm)",
              error: "Insira uma altura!",
              controller: heightController),
          //buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  String textoModificado(texto){
    return texto + "modificado";
  }

  Widget tituloForm() {
    return const Text(
      "Preencha os campos abaixo para calcular seu IMC.",
      style: TextStyle(color: Color.fromARGB(255, 190, 18, 18), fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Widget buildTextFormField(
      {required TextEditingController controller,
      required String error,
      required String label}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (text) {
        return text!.isEmpty ? error : null;
      },
    );
  }

  Widget buildCalculateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blue), // Cor do botão
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            const CalculoImc().calculateImc();
            
            //debugPrint("clicou");
        }
        },
        child: const Text('CALCULAR',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w700)),
      ),
    );
  }

}

/*Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _MyHomePageState()._result,
        textAlign: TextAlign.center,
      ),
    );
  }

}
class Widget {
  Padding buildCalculateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'CALCULAR',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'CALCULAR',
      style: TextStyle(color: Colors.black),
    );
  }
}
*/