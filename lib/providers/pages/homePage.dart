import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:practica_obligatoria_t5/providers/model/currency.dart';
import 'package:practica_obligatoria_t5/providers/services/currencyService.dart';
import 'package:practica_obligatoria_t5/providers/services/deviceInfo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceInfo dev = DeviceInfo();

    return FutureBuilder(
      future: dev.getInfo(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [LinearProgressIndicator()],
          );
        } else {
          Map<String, dynamic> mapa = snapshot.data!;
          return FutureBuilder(
            future: CurrencyService().getCurrency(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Currency>> snapshot2) {
              if (snapshot2.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [LinearProgressIndicator()],
                );
              } else {
                List<Currency> divisas = snapshot2.data!;
                return Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    title: Text("Informacion"),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getIdentificator(mapa)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: ClipRRect(
                                child: Flag.fromString(divisas[0].flag,
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
                    await currencyService.getCurrency();
                    mapa.forEach((key, value) {});
                  }),
                );
              }
            },
          );
        }
      },
    );
  }

  String getIdentificator(Map<String, dynamic> mapa) {
    if (mapa.containsKey("androidID")) {
      print(mapa["androidId"]);
      return mapa["androidId"];
    } else {
      if (mapa.containsKey("computerName")) {
        return "${mapa["computerName"]}${mapa["numberOfCores"]}${mapa["systemMemoryInMegabytes"]}";
      } else {
        print(
            "${mapa["computerName"]}${mapa["numberOfCores"]}${mapa["systemMemoryInMegabytes"]}");
        return mapa["identifierForVendor"];
      }
    }
  }
}
