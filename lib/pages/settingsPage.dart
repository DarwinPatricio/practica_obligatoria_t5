import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/Widget/apariencia.dart';
import 'package:practica_obligatoria_t5/Widget/cartera.dart';
import 'package:practica_obligatoria_t5/Widget/visualizacion.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, account, child) => SingleChildScrollView(
        child: Center(
          child: Container(
            width: Platform.isWindows
                ? MediaQuery.of(context).size.width * 0.5
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Cartera(account),
                Apariencia(account),
                Visualizacion(account),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white60),child: ListTile(title: Center(child: Text("Volver a ver el tutorial")),onTap: (){Navigator.pushReplacementNamed(context, 'intro');},)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

