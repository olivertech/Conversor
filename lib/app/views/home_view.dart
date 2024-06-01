// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:conversor/app/components/currency_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//VER SE CONSIGO RESOLVER O PROBLEMA DO SETSTATE MUDANDO DE STATELESS PARA STATEFULL

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Variável local de estilo aplicado aos botões
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Colors.amber,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120.0, bottom: 40),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CurrencyComponent(),
                SizedBox(height: 15),
                CurrencyComponent(),
                SizedBox(height: 50),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: Text("CONVERTER"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
