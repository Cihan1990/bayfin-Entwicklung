import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TwelveDataService {
  final String apiKey;

  TwelveDataService({required this.apiKey});

  Future<Map<String, dynamic>?> fetchStockData(String symbol) async {
    final url = Uri.parse(
        'https://api.twelvedata.com/quote?symbol=$symbol&apikey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Überprüfen, ob 'symbol' existiert und zurückgeben
      if (data['symbol'] != null) {
        return data;
      } else {
        debugPrint('Fehler bei der API-Antwort: ${data['message']}');
        return null;
      }
    } else {
      debugPrint('Fehler beim Abrufen der Daten: ${response.reasonPhrase}');
      return null;
    }
  }
}
