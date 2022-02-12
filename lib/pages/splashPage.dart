import 'dart:ffi';

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
    return Container();
  }

  _verificaCuenta() async {
    AppProvider ap = Provider.of<AppProvider>(context, listen: false);
    await ap.getCuenta();
    print("hey");
    Navigator.pushReplacementNamed(context, ap.nueva ? "home" : "intro");
  }
}
