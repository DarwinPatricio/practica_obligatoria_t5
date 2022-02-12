import 'dart:convert';

class Account {
  Account({
    required this.crypWallet,
    required this.digits,
    required this.divWallet,
    required this.negrita,
    required this.tema,
  });

  int crypWallet;
  int digits;
  int divWallet;
  bool negrita;
  bool tema;

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        crypWallet: json["crypWallet"],
        digits: json["digits"],
        divWallet: json["divWallet"],
        negrita: json["negrita"],
        tema: json["tema"],
      );

  Map<String, dynamic> toMap() => {
        "crypWallet": crypWallet,
        "digits": digits,
        "divWallet": divWallet,
        "negrita": negrita,
        "tema": tema,
      };
}
