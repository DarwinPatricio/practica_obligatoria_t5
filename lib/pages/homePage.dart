import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/services/deviceInfo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceInfo dev = DeviceInfo();

    return FutureBuilder(
      future: dev.getInfo(),
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        } else {
          Map<String, dynamic> mapa = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text("Informacion"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () async {
              mapa.forEach((key, value) {
                print(key);
                print(value);
                print("/n");
              });
            }),
          );
        }
      },
    );
  }

  String getIdentificator(Map<String, dynamic> mapa) {
    if (mapa.containsKey("androidID")) {
      return mapa["androidId"];
    } else {
      if (mapa.containsKey("computerName")) {
        return mapa["computerName"];
      } else {
        return mapa["identifierForVendor"];
      }
    }
  }
}
