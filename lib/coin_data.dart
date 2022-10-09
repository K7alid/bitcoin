import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
//https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=4A434275-2C0D-4804-BDA2-C01C2EA56918
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4A434275-2C0D-4804-BDA2-C01C2EA56918';

class CoinData {
  Future getCoinData(String selectedCurrency, String cryptoCurrency) async {
    String requestURL =
        '$coinAPIURL/$cryptoCurrency/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
