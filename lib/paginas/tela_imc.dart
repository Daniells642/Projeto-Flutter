import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TelaIMC extends StatefulWidget {
  const TelaIMC({super.key});

  @override
  State<TelaIMC> createState() => _TelaIMCState();
}

class _TelaIMCState extends State<TelaIMC> {
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
          //1
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                //Text("RESPONDER", style: TextStyle(color: Color.fromARGB(255, 250, 250, 250))),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                )
              ],
            ),
          ),
          //2
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          //3
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 23, 255),
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    );
  }
}
