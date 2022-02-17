import 'dart:io';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';

class DivCard extends StatelessWidget {
  late AppProvider account;
  int index;
  DivCard(this.account, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            color: account.cuenta.tema ? Colors.deepPurple[200] : Colors.grey,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: ListTile(
            onTap: () {
              print(account.divisas[index].value);
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flag.fromString(
                  account.divisas[index].image,
                  borderRadius: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              account.divisas[index].name,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: (account.cuenta.negrita ? FontWeight.bold : null),
                fontSize: account.cuenta.negrita ? 20 : null,
              ),
            ),
            trailing: FittedBox(
                child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: Platform.isWindows
                      ? MediaQuery.of(context).size.width * 0.05
                      : MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "${(account.cuenta.divWallet * account.divisas[index].value).toStringAsFixed(account.cuenta.digits)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                      child: Text(
                    account.divisas[index].symbol,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  )),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
