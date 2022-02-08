import 'dart:convert';

class Currency {
    Currency({
        required this.flag,
        required this.name,
        required this.symbol,
        required this.value,
    });

    String flag;
    String name;
    String symbol;
    double value;

    factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        flag: json["flag"],
        name: json["name"],
        symbol: json["symbol"],
        value: json["value"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "flag": flag,
        "name": name,
        "symbol": symbol,
        "value": value,
    };
}
