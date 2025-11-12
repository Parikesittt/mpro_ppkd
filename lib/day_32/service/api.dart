import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:belajar_ppkd/day_32/models/crypto_model.dart';

Future<List<CryptoModel>> fetchCrypto() async {
  final response = await http.get(
    Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr"),
  );
  // print(response.statusCode);
  if (response.statusCode == 200) {
    // print("Test");
    final List<dynamic> cryptoJson = json.decode(response.body);
    // print(cryptoJson);
    
    return cryptoJson.map((json) => CryptoModel.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load user");
  }
}
