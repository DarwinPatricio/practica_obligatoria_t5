import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/Widget/apariencia.dart';
import 'package:practica_obligatoria_t5/model/account.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, account, child) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Apariencia(account),
            Visualizacion(account),
          ],
        ),
      ),
    );
  }
}

class Visualizacion extends StatelessWidget {
  AppProvider account;
  Visualizacion(this.account);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Visualizacion",
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
                ListTile(
                  title: Text("Numero de digitos"),
                ),
                ListTile(
                    title: Text("0"),
                    trailing:
                        account.cuenta.digits == 0 ? Icon(Icons.check) : null,
                    onTap: () async {
                      await account.cambiaDigitos(0);
                    }),
                Divider(
                  height: 0,
                ),
                ListTile(
                    title: Text("1"),
                    trailing:
                        account.cuenta.digits == 1 ? Icon(Icons.check) : null,
                    onTap: () async {
                      await account.cambiaDigitos(1);
                    }),
                Divider(
                  height: 0,
                ),
                ListTile(
                    title: Text("2"),
                    trailing:
                        account.cuenta.digits == 2 ? Icon(Icons.check) : null,
                    onTap: () async {
                      await account.cambiaDigitos(2);
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
