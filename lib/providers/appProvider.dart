import 'package:flutter/cupertino.dart';
import 'package:practica_obligatoria_t5/model/account.dart';
import 'package:practica_obligatoria_t5/services/accountService.dart';
import 'package:practica_obligatoria_t5/services/deviceInfo.dart';

class AppProvider extends ChangeNotifier {
  late String id;
  Account cuenta = Account(
      crypWallet: 0, digits: 2, divWallet: 0, negrita: true, tema: true);
  bool nueva = false;

  getCuenta() async {
    AccountServices ac = AccountServices();
    DeviceInfo deviceInfo = DeviceInfo();
    this.id = await deviceInfo.getInfo();
    if (await ac.exits(id)) {
      nueva = true;
    } else {
      cuenta = await ac.createAccount(id);
      nueva = false;
    }
    notifyListeners();
  }

  cambiaColor(valor) {
    cuenta.tema = valor;
    notifyListeners();
  }
}
