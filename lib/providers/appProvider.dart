import 'package:flutter/cupertino.dart';
import 'package:practica_obligatoria_t5/model/account.dart';
import 'package:practica_obligatoria_t5/model/currency.dart';
import 'package:practica_obligatoria_t5/services/accountService.dart';
import 'package:practica_obligatoria_t5/services/currencyService.dart';
import 'package:practica_obligatoria_t5/services/deviceInfo.dart';

class AppProvider extends ChangeNotifier {
  late String id;
  Account cuenta = Account(
      crypWallet: 0, digits: 2, divWallet: 0, negrita: true, tema: true);
  bool nueva = false;
  List<Currency> divisas = [];
  List<Currency> cryptos = [];
  AccountServices ac = AccountServices();
  String cantidad = "";

  getCuenta() async {
    DeviceInfo deviceInfo = DeviceInfo();
    this.id = await deviceInfo.getInfo();
    if (await ac.exits(id)) {
      nueva = true;
      cuenta = await ac.getAcc(id);
    } else {
      nueva = false;
      cuenta = await ac.createAccount(id);
    }
    CurrencyService cs = CurrencyService();
    divisas = await cs.getCurrency();
    cryptos = await cs.getCrypto();
    notifyListeners();
  }

  cambiaTema(valor) async {
    cuenta.tema = valor;
    await ac.updateAccount(id, cuenta);
    notifyListeners();
  }

  cambiaDigitos(valor) async {
    cuenta.digits = valor;
    await ac.updateAccount(id, cuenta);
    notifyListeners();
  }

  cambiaBold(valor) async {
    cuenta.negrita = valor;
    await ac.updateAccount(id, cuenta);
    notifyListeners();
  }

  cambiaCrypWallet(cantidad) async {
    cuenta.crypWallet = cantidad;
    await ac.updateAccount(id, cuenta);
    notifyListeners();
  }

  cambiaDivpWallet(cantidad) async {
    cuenta.divWallet = cantidad;
    await ac.updateAccount(id, cuenta);
    notifyListeners();
  }

  cambiaCantidad(valor) async {
    cantidad = valor;
    notifyListeners();
  }
}
