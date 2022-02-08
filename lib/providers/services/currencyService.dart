import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:practica_obligatoria_t5/providers/model/currency.dart';

class CurrencyService {
  String _url = "https://fiii-wallet-default-rtdb.firebaseio.com/Currency.json";

  Future<List<Currency>> getCurrency() async {
    List<Currency> divisas = [];
    final resp = await http.get(Uri.parse(_url));
    print(resp.body);
    for (var item in jsonDecode(resp.body) as List) {
      divisas.add(Currency.fromMap(item));
    }
    return divisas;
  }
}
