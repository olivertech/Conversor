// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CurrencyComponent extends StatefulWidget {
  const CurrencyComponent({super.key});

  @override
  State<CurrencyComponent> createState() => _CurrencyComponentState();
}

class _CurrencyComponentState extends State<CurrencyComponent> {
  String? selectedMoeda = "Real";
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              underline: Container(height: 1, color: Colors.amber),
              iconEnabledColor: Colors.amber,
              iconSize: 30,
              items: dropdownItems,
              isExpanded: true,
              value: selectedMoeda,
              hint: Text("Selecione a Moeda"),
              onChanged: (String? value) {
                setState(() {
                  selectedMoeda = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
                hintText: 'Valor Orginal',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                icon: Icon(Icons.currency_exchange),
                hintFadeDuration: Durations.short1),
          ),
        ),
      ],
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "Real", child: Text("Real")),
    DropdownMenuItem(value: "Dolar", child: Text("Dólar")),
  ];
  return menuItems;
}
