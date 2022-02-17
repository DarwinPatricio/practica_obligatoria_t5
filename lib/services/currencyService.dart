import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:practica_obligatoria_t5/model/currency.dart';

class CurrencyService {
  String _url1 =
      "https://fiii-wallet-default-rtdb.firebaseio.com/Currency.json";
  String _url2 = "https://fiii-wallet-default-rtdb.firebaseio.com/Crypto.json";

  Future<List<Currency>> getCurrency() async {
    List<Currency> divisas = [];
    final resp = await http.get(Uri.parse(_url1));
    for (var item in jsonDecode(resp.body) as List) {
      divisas.add(Currency.fromMap(item));
    }
    return divisas;
  }

  Future<List<Currency>> getCrypto() async {
    List<Currency> cryp = [];
    final resp = await http.get(Uri.parse(_url2));
    for (var item in jsonDecode(resp.body) as List) {
      cryp.add(Currency.fromMap(item));
    }
    return cryp;
  }
}
