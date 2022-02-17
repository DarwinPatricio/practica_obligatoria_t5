import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List title = ["FII-Wallet", "Divisas", "Cryptos"];
  List Mensajes = [
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos",
    "Mantén tus divisas seguras y haz los cambios entre ellas de manera sencilla",
    "Usa y almacena tus cryptos, mantenlas seguras en FIII-Wallet"
  ];
  List imagenes = ["assets/img1.svg", "assets/img3.svg", "assets/img2.svg"];
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: Mensajes.length,
                    itemBuilder: (context, index) {
                      return _BodyPage(
                        title[index],
                        Mensajes[index],
                        imagenes[index],
                      );
                    }),
              ),
              Expanded(
                  flex: 2,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 253, 173, 213),
                          Colors.orange,
                        ],
                      )),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(child: SizedBox()),
                          Center(
                            child: SvgPicture.asset(
                              "assets/bottonboard.svg",
                              height: Platform.isWindows
                                  ? MediaQuery.of(context).size.height * 0.25
                                  : null,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                  Mensajes.length, (index) => buildDot(index)),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentPage == 2) {
                                    Navigator.pushReplacementNamed(
                                        context, 'home');
                                  } else {
                                    currentPage++;

                                    pageController.nextPage(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.ease);
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blueGrey,
                                ),
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: currentPage == 2
                                    ? Text(
                                        "Comienza",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      )
                                    : Text(
                                        "Siguiente",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                              )),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _BodyPage(title, mensaj, imagen) {
    print(imagen);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.orange,
          Color.fromARGB(255, 253, 173, 213),
        ],
      )),
      child: Stack(children: [
        SvgPicture.asset(
          "assets/topBoard.svg",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                    child: title == "Cryptos"
                        ? Text("")
                        : Text(
                            "SKIP >>",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ))
              ],
            ),
            Expanded(
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    SvgPicture.asset(
                      imagen,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        mensaj,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ]),
    );
  }

  AnimatedContainer buildDot(index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.pink : Colors.blueGrey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
