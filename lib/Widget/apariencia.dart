import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';

class Apariencia extends StatelessWidget {
  late AppProvider account;
  Apariencia(this.account);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Apariencia",
              style: TextStyle(
                fontSize: 20,
                fontWeight: (account.cuenta.negrita ? FontWeight.bold : null),
              ),
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white60),
            child: Column(
              children: [
                SwitchListTile.adaptive(
                    title: Text("Tema"),
                    subtitle: Text("Oscuro / Claro"),
                    value: account.cuenta.tema,
                    onChanged: (value) async {
                      await account.cambiaTema(value);
                    }),
                SwitchListTile.adaptive(
                    title: Text("Negrita"),
                    subtitle: Text("Normal / Negrita"),
                    value: account.cuenta.negrita,
                    onChanged: (value) async {
                      await account.cambiaBold(value);
                    }),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
