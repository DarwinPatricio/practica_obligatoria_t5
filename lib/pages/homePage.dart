import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:practica_obligatoria_t5/model/currency.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:practica_obligatoria_t5/services/accountService.dart';
import 'package:practica_obligatoria_t5/services/currencyService.dart';
import 'package:practica_obligatoria_t5/services/deviceInfo.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceInfo dev = DeviceInfo();

    return FutureBuilder(
      future: dev.getInfo(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [LinearProgressIndicator()],
          );
        } else {
          String id = snapshot.data!;
          return FutureBuilder(
            future: CurrencyService().getCurrency(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Currency>> snapshot2) {
              if (snapshot2.connectionState == ConnectionState.waiting) {
                return Container(
                  color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [LinearProgressIndicator()],
                  ),
                );
              } else {
                List<Currency> divisas = snapshot2.data!;
                return Scaffold(
                  backgroundColor: Colors.amber,
                  appBar: AppBar(
                    title: Text("Informacion"),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(id),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: ClipRRect(
                                child: Flag.fromString(divisas[0].image,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    borderRadius: 25)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton:
                      FloatingActionButton(onPressed: () async {
                    CurrencyService currencyService = CurrencyService();
                    AccountServices accountServices = AccountServices();
                    await currencyService.getCurrency();
                    AppProvider ap =
                        Provider.of<AppProvider>(context, listen: false);
                    ap.cambiaColor(!ap.cuenta.tema);
                  }),
                );
              }
            },
          );
        }
      },
    );
  }
}
