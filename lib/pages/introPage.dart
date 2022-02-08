import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List Mensajes = [
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos",
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos22222",
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos33333"
  ];

  List imagenes = [
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos",
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos4444",
    "Bienvenido a tu Cartera Virtual de Divisas Y Cryptos5555"
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: Mensajes.length,
                    itemBuilder: (context, index) {
                      return _BodyPage(
                        Mensajes[index],
                        imagenes[index],
                      );
                    }),
              ),
              Expanded(
                  flex: 2,
                  child: SizedBox(
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
                        ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          child: Text("Siguiente"),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _BodyPage(mensaj, imagen) {
    return Container(
      color: Colors.black,
      child: Text(
        mensaj,
        textAlign: TextAlign.center,
      ),
    );
  }

  AnimatedContainer buildDot(index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.amber : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
