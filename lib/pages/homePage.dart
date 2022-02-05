import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/services/deviceInfo.dart';
import 'package:flag/flag.dart';

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
                children: [
                  Text(getIdentificator(mapa)),
                  CircleAvatar(
                    radius: 20,
                    child: ClipRRect(
                      child: Flag.fromString('EU', fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () async {
              mapa.forEach((key, value) {
                print(key);
                print(value);
              });
            }),
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
        print(
            "${mapa["computerName"]}${mapa["numberOfCores"]}${mapa["systemMemoryInMegabytes"]}");
        return "${mapa["computerName"]}${mapa["numberOfCores"]}${mapa["systemMemoryInMegabytes"]}";
      } else {
        print(
            "${mapa["computerName"]}${mapa["numberOfCores"]}${mapa["systemMemoryInMegabytes"]}");
        return mapa["identifierForVendor"];
      }
    }
  }
}
