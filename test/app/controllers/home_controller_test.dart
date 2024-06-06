// ignore_for_file: unused_local_variable

import 'package:conversor/app/controllers/home_controller.dart';
import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  ///Teste 1 - Conversão de real para dolar
  test('Teste 1 - Conversão de real para dolar', () {
    toText.text = '2.0';
    final homeController = HomeController(
      toText: toText,
      fromText: fromText,
      toCurrency: CurrencyModel(
          name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.020816),
      fromCurrency: CurrencyModel(
          name: 'Dolar', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.002018),
    );
    homeController.convert();
    expect(fromText.text, '0.36');
  });

  ///Teste 2 - Conversão de dolar para real
  test('Teste 2 - Conversão de dolar para real', () {
    toText.text = '1.0';
    final homeController = HomeController(
      toText: toText,
      fromText: fromText,
      toCurrency: CurrencyModel(
          name: 'Dolar', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.002018),
      fromCurrency: CurrencyModel(
          name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.020816),
    );
    homeController.convert();
    expect(fromText.text, '5.65');
  });

  ///Teste 3 - Conversão de dolar para real forçando o uso de vírgula em vez de ponto
  test(
      'Teste 3 - Conversão de dolar para real forçando o uso de vírgula em vez de ponto',
      () {
    toText.text = '1,0';
    final homeController = HomeController(
      toText: toText,
      fromText: fromText,
      toCurrency: CurrencyModel(
          name: 'Dolar', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.002018),
      fromCurrency: CurrencyModel(
          name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.020816),
    );
    homeController.convert();
    expect(fromText.text, '5.65');
  });
}
