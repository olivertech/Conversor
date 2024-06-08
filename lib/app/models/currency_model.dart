class CurrencyModel {
  ///Propriedades da Model
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  ///Construtor
  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  ///Método estático que retorna as moedas
  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.020816),
      CurrencyModel(
          name: 'Dolar', real: 5.65, dolar: 1.0, euro: 0.85, bitcoin: 0.002018),
      CurrencyModel(
          name: 'Euro', real: 6.65, dolar: 1.17, euro: 1.0, bitcoin: 0.02010),
      CurrencyModel(
          name: 'Bitcoin',
          real: 64116.51,
          dolar: 113510.30,
          euro: 9639.54,
          bitcoin: 1.0),
    ];
  }
}
