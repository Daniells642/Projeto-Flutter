import 'package:flutter/material.dart';

class CalculoPage extends StatefulWidget {
  const CalculoPage({super.key});

  @override
  State<CalculoPage> createState() => _CalculoPageState();
}

class _CalculoPageState extends State<CalculoPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  late String _result;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _result = 'Informe seus dados';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: buildForm(),
        ));
  }

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
          resetFields();
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
          buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
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
            calculateImc();

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

  Widget buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
      ),
    );
  }

  void calculateImc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100.0;
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
  }
}
