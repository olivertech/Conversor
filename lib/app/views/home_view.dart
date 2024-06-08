// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, use_key_in_widget_constructors, unused_field, no_logic_in_create_state, prefer_final_fields, slash_for_doc_comments
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:conversor/app/components/currency_component.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:conversor/app/models/currency_model.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Variável local de estilo aplicado aos botões
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    backgroundColor: Colors.amber,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );

  TextEditingController _toText = TextEditingController();
  TextEditingController _fromText = TextEditingController();
  CurrencyModel _toCurrency = CurrencyModel(
    name: 'Real',
    real: 1.0,
    dolar: 0.18,
    euro: 0.15,
    bitcoin: 0.020816,
  );
  CurrencyModel _fromCurrency = CurrencyModel(
    name: 'Dolar',
    real: 5.65,
    dolar: 1.0,
    euro: 0.85,
    bitcoin: 0.002018,
  );
  late HomeController _homeController;

/**
 * Esse initState pode ser usado como contrutor num widget statefull
 */
  @override
  void initState() {
    super.initState();
    _homeController = HomeController(
        toText: _toText,
        fromText: _fromText,
        toCurrency: _toCurrency,
        fromCurrency: _fromCurrency);
  }

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
                CurrencyComponent(
                  items: _homeController.currencies,
                  controller: _toText,
                  selectedCurrency: _toCurrency,
                  index: 0,
                  onChange: (value) {
                    print(value.name);
                  },
                ),
                SizedBox(height: 15),
                CurrencyComponent(
                  items: _homeController.currencies,
                  controller: _fromText,
                  selectedCurrency: _fromCurrency,
                  index: 1,
                  onChange: (value) {
                    print(value.name);
                  },
                ),
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

// List<DropdownMenuItem<CurrencyModel>> get dropdownItems {
//   List<DropdownMenuItem<CurrencyModel>> menuItems = [
//     DropdownMenuItem(value: "Real", child: Text("Real")),
//     DropdownMenuItem(value: "Dolar", child: Text("Dólar")),
//   ];
//   return menuItems;
// }
