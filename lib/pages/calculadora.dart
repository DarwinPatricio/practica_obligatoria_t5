import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List argumentos = ModalRoute.of(context)!.settings.arguments as List;
    double value = argumentos[0];
    return Consumer<AppProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text("Cambio de ${argumentos[1]}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: FittedBox(
                              child: Text(
                            provider.cantidad == "" ? "0" : provider.cantidad,
                            style: TextStyle(fontSize: 40),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(),
                    SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}1");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('1',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}2");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('2',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}3");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('3',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}4");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('4',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}5");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('5',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}6");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('6',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}7");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('7',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}8");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('8',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("${provider.cantidad}9");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('9',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.cambiaCantidad("");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('Reset',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cantidad == ""
                                ? provider
                                    .cambiaCantidad("${provider.cantidad}")
                                : provider
                                    .cambiaCantidad("${provider.cantidad}0");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('0',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            provider.cantidad.contains(".")
                                ? provider
                                    .cambiaCantidad("${provider.cantidad}")
                                : provider.cantidad == ""
                                    ? provider.cambiaCantidad(
                                        "${provider.cantidad}0.")
                                    : provider.cambiaCantidad(
                                        "${provider.cantidad}.");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: Text('.',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white))),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        double cant = provider.cantidad == ""
                            ? 0
                            : double.parse(provider.cantidad);
                        double newcant = argumentos[1] == "divisas"
                            ? cant / value
                            : (cant * value);
                        argumentos[1] == "divisas"
                            ? await provider.cambiaDivpWallet(newcant)
                            : await provider.cambiaCrypWallet(newcant);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueGrey),
                          child: Center(
                              child: Text(
                            "Convertir",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
