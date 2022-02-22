import 'dart:io';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';

class CrypCard extends StatelessWidget {
  late AppProvider account;
  int index;
  CrypCard(this.account, this.index);

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
              account.cambiaCantidad("");
              Navigator.pushNamed(context, 'calculadora',
                  arguments: [account.cryptos[index].value, 'crypto']);
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeInImage(
                    placeholderFit: BoxFit.cover,
                    placeholder: AssetImage("assets/cargando.gif"),
                    image: NetworkImage(account.cryptos[index].image),
                  )),
            ),
            title: Text(
              account.cryptos[index].name,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: (account.cuenta.negrita ? FontWeight.bold : null),
                fontSize: account.cuenta.negrita ? 20 : null,
              ),
            ),
            subtitle: Text(
              account.cryptos[index].symbol,
              style: TextStyle(fontSize: 12),
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
                    child: FittedBox(
                      child: Text(
                        "${(account.cuenta.crypWallet / account.cryptos[index].value).toStringAsFixed(account.cuenta.digits)}",
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
