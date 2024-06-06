// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:conversor/app/models/currency_model.dart';

class HomeController {
  List<CurrencyModel> currencies = List.empty();
  final TextEditingController toText;
  final TextEditingController fromText;
  final CurrencyModel toCurrency;
  final CurrencyModel fromCurrency;

  HomeController({
    required this.toText,
    required this.fromText,
    required this.toCurrency,
    required this.fromCurrency,
  }) {
    currencies = CurrencyModel.getCurrencies();
  }

  void convert() {
    double inputValue =
        double.tryParse(toText.text.replaceAll(',', '.')) ?? 1.0;
    double convertedValue = 0;

    switch (fromCurrency.name) {
      case 'Real':
        convertedValue = inputValue * toCurrency.real;
        break;
      case 'Dolar':
        convertedValue = inputValue * toCurrency.dolar;
        break;
      case 'Euro':
        convertedValue = inputValue * toCurrency.euro;
        break;
      case 'Bitcoin':
        convertedValue = inputValue * toCurrency.bitcoin;
        break;
    }

    fromText.text = convertedValue.toStringAsFixed(2);
  }
}
