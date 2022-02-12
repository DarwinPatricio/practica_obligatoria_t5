import 'dart:convert';

class Currency {
  Currency({
    required this.image,
    required this.name,
    required this.symbol,
    required this.value,
  });

  String image;
  String name;
  String symbol;
  double value;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
        image: json["Image"],
        name: json["name"],
        symbol: json["symbol"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "Image": image,
        "name": name,
        "symbol": symbol,
        "value": value,
      };
}
