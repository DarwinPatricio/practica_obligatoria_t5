import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/pages/cryptoPage.dart';

import 'package:practica_obligatoria_t5/pages/divisasPage.dart';
import 'package:practica_obligatoria_t5/pages/settingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [DivisasPage(), CrypoPage(), SettingsPage()];

  final titulos = ["Divisas", "Cyptomonedas", "Ajustes"];

  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text(titulos[indice]))),
        body: pages[indice],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indice,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_rounded), label: "Divisas"),
            BottomNavigationBarItem(
                icon: Icon(CryptoFontIcons.BTC), label: "CryptoMonedas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Ajustes")
          ],
          onTap: (index) {
            setState(() {
              indice = index;
            });
          },
        ),
      ),
    );
  }
}
