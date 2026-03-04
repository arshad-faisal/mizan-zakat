import 'dart:convert';
import 'package:http/http.dart' as http;

class GoldPriceService {
  Future<Map<String, double>> fetchMetalPricesUSD() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.metals.live/v1/spot/gold,silver'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final goldOz   = (data[0]['price'] as num).toDouble();
        final silverOz = (data[1]['price'] as num).toDouble();
        return {
          'goldPerGram':   goldOz   / 31.1035,
          'silverPerGram': silverOz / 31.1035,
        };
      }
    } catch (_) {}
    return {'goldPerGram': 60.0, 'silverPerGram': 0.75};
  }

  Future<double> fetchExchangeRate(String currencyCode) async {
    if (currencyCode == 'USD') return 1.0;
    try {
      final response = await http
          .get(Uri.parse('https://open.er-api.com/v6/latest/USD'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data  = jsonDecode(response.body);
        final rates = data['rates'] as Map<String, dynamic>;
        return (rates[currencyCode] as num?)?.toDouble() ?? 1.0;
      }
    } catch (_) {}
    return 1.0;
  }
}
