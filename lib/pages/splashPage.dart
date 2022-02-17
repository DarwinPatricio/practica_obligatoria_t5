import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _verificaCuenta();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "FIII-Wallet",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueGrey),
                ),
                Image.asset(
                  "assets/cover.png",
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  "assets/Ajux_loader.gif",
                  height: MediaQuery.of(context).size.height * 0.25,
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 253, 173, 213),
                  Colors.orange,
                  Colors.orange,
                  Color.fromARGB(255, 253, 173, 213),
                ],
              ),
            )),
      ),
    );
  }

  _verificaCuenta() async {
    AppProvider ap = Provider.of<AppProvider>(context, listen: false);
    await ap.getCuenta();
    Navigator.pushReplacementNamed(context, ap.nueva ? "home" : "intro");
  }
}
