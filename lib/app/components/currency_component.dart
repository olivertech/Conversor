// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, unused_field, slash_for_doc_comments

import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

/**
 * Classe StateFull
 */
class CurrencyComponent extends StatefulWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedCurrency;
  final int index;
  //Funçao que uso pra retornar o valor interno do componente
  final Function(CurrencyModel value) onChange;

/**
 * Construtor
 */
  const CurrencyComponent(
      {super.key,
      required this.items,
      required this.controller,
      required this.selectedCurrency,
      required this.index,
      required this.onChange});

/**
 * Classe State
 */
  @override
  State<CurrencyComponent> createState() => _CurrencyComponentState();
}

class _CurrencyComponentState extends State<CurrencyComponent> {
  late CurrencyModel current;

  @override
  void initState() {
    super.initState();
    current = widget.items[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              underline: Container(height: 1, color: Colors.amber),
              iconEnabledColor: Colors.amber,
              iconSize: 30,
              items: widget.items
                  .map((e) => DropdownMenuItem<CurrencyModel>(
                      value: e, child: Text(e.name)))
                  .toList(),
              isExpanded: true,
              value: current,
              hint: Text('Moeda'),
              onChanged: (CurrencyModel? newValue) {
                setState(() {
                  current = newValue!;
                });
                widget.onChange(newValue!);
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
            controller: widget.controller,
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
