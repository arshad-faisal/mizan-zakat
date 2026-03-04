import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class GoldPriceService {
  Future<Map<String, double>> fetchMetalPricesUSD() async {
    try {
      final response = await http
          .get(
            Uri.parse('https://api.metals.live/v1/spot'),
            headers: {'Accept': 'application/json'},
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        double goldPerOz = 0;
        double silverPerOz = 0;
        for (var item in data) {
          if (item is Map) {
            if (item.containsKey('gold')) {
              goldPerOz = (item['gold'] as num).toDouble();
            }
            if (item.containsKey('silver')) {
              silverPerOz = (item['silver'] as num).toDouble();
            }
          }
        }
        if (goldPerOz > 0 && silverPerOz > 0) {
          return {
            'goldPerGram': goldPerOz / 31.1035,
            'silverPerGram': silverPerOz / 31.1035,
          };
        }
      }
    } catch (e) {
      debugPrint('Metal price fetch error: $e');
    }
    return {
      'goldPerGram': 92.5,
      'silverPerGram': 1.05,
    };
  }

  Future<double> fetchExchangeRate(String currencyCode) async {
    if (currencyCode == 'USD') return 1.0;
    try {
      final response = await http
          .get(Uri.parse('https://open.er-api.com/v6/latest/USD'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final rates = data['rates'] as Map<String, dynamic>;
        if (rates.containsKey(currencyCode)) {
          return (rates[currencyCode] as num).toDouble();
        }
      }
    } catch (e) {
      debugPrint('Exchange rate error: $e');
    }
    const fallback = {
      'INR': 83.5, 'SAR': 3.75, 'AED': 3.67,
      'PKR': 278.0, 'BDT': 110.0, 'GBP': 0.79,
      'EUR': 0.92, 'MYR': 4.7, 'IDR': 15800.0,
      'TRY': 32.0, 'EGP': 48.0, 'NGN': 1550.0,
      'MAD': 10.0, 'AUD': 1.53, 'CAD': 1.36,
      'QAR': 3.64, 'KWD': 0.31, 'OMR': 0.38,
      'BHD': 0.38, 'ZAR': 18.6,
    };
    return fallback[currencyCode] ?? 1.0;
  }
}
