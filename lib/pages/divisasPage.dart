import 'dart:io';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/Widget/divcard.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';

class DivisasPage extends StatelessWidget {
  const DivisasPage({
    Key? key,
  }) : super(key: key);

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
                      return DivCard(account, index);
                    }),
              ),
            ));
  }
}
