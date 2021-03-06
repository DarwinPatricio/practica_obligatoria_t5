import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:practica_obligatoria_t5/routes/rutas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
          lazy: true,
        ),
      ],
      child: Consumer<AppProvider>(
        builder: ((context, acc, child) => MaterialApp(
              title: 'FII-Wallet',
              debugShowCheckedModeBanner: false,
              theme: acc.cuenta.tema
                  ? ThemeData(
                      primarySwatch: Colors.indigo,
                      scaffoldBackgroundColor:
                          Color.fromARGB(255, 247, 215, 231),
                    )
                  : ThemeData.dark(),
              initialRoute: 'splash',
              routes: getAplicacionesRoutes(),
            )),
      ),
    );
  }
}
