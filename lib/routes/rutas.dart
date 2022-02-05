import 'package:flutter/material.dart';

import '../pages/homePage.dart';
import '../pages/introPage.dart';

Map<String, WidgetBuilder> getAplicacionesRoutes() {
  return <String, WidgetBuilder>{
    'splash': (BuildContext context) => IntroPage(),
    'home': (BuildContext context) => HomePage(),
  };
}