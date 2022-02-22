import 'package:flutter/material.dart';
import 'package:practica_obligatoria_t5/pages/calculadora.dart';
import 'package:practica_obligatoria_t5/pages/splashPage.dart';

import '../pages/homePage.dart';
import '../pages/introPage.dart';

Map<String, WidgetBuilder> getAplicacionesRoutes() {
  return <String, WidgetBuilder>{
    'splash': (BuildContext context) => SplashPage(),
    'intro': (BuildContext context) => IntroPage(),
    'home': (BuildContext context) => HomePage(),
    'calculadora':(BuildContext context) => Calculadora(),
  };
}
