
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';

class Cartera extends StatelessWidget {
  AppProvider account;
  Cartera(this.account);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Cartera",
              style: TextStyle(
                fontSize: 20,
                fontWeight: (account.cuenta.negrita ? FontWeight.bold : null),
              ),
            ),
          ),
        ),
        Divider(),
        ListTile(
            title: Text(
              "Divisas",
              style: TextStyle(
                fontWeight: account.cuenta.negrita ? FontWeight.bold : null,
              ),
            ),
            trailing: Text(
              "${account.cuenta.divWallet.toStringAsFixed(account.cuenta.digits)} €",
              style: TextStyle(
                fontWeight: account.cuenta.negrita ? FontWeight.bold : null,
              ),
            )),
        ListTile(
          title: Text(
            "Cryptomonedas",
            style: TextStyle(
              fontWeight: account.cuenta.negrita ? FontWeight.bold : null,
            ),
          ),
          trailing: Text(
              "${(account.cuenta.crypWallet).toStringAsFixed(account.cuenta.digits)} €",
              style: TextStyle(
                fontWeight: account.cuenta.negrita ? FontWeight.bold : null,
              )),
        )
      ],
    );
  }
}