import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/Widget/crypcard.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';

class CrypoPage extends StatelessWidget {
  const CrypoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, account, child) => Center(
              child: Container(
                width: Platform.isWindows
                    ? MediaQuery.of(context).size.width * 0.5
                    : null,
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          height: 1,
                        ),
                    itemCount: account.divisas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CrypCard(account, index);
                    }),
              ),
            ));
  }
}
