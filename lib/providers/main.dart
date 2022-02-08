import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/providers/routes/rutas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'FernanWallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: getAplicacionesRoutes(),
    );
  }
}