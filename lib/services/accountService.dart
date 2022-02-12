import 'dart:convert';

import 'package:practica_obligatoria_t5/model/account.dart';
import 'package:http/http.dart' as http;

class AccountServices {
  Future<bool> exits(id) async {
    print(id);
    final resp = await http.get(Uri.parse(
        "https://fiii-wallet-default-rtdb.firebaseio.com/Accounts/${id}.json"));
    if (resp.body == "null") {
      return false;
    }
    return true;
  }

  Future<Account> createAccount(id) async {
    Account acc = Account(
        crypWallet: 0, digits: 2, divWallet: 0, negrita: true, tema: true);
    final resp = await http.put(
        Uri.parse(
            "https://fiii-wallet-default-rtdb.firebaseio.com/Accounts/${id}.json"),
        body: acc.toJson());
    return Account.fromJson(resp.body);
  }
}
