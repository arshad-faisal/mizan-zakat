import 'dart:convert';
import 'package:http/http.dart' as http;

class GoldPriceService {
  // Fallback prices in USD per gram
  static const double _fallbackGoldPrice = 60.0;
  static const double _fallbackSilverPrice = 0.75;

  Future<Map<String, double>> getPrices(String currencyCode) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.metals.live/v1/spot/gold,silver'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        double goldOz = (data[0]['price'] as num).toDouble();
        double silverOz = (data[1]['price'] as num).toDouble();
        // Convert troy oz to grams (1 troy oz = 31.1035 grams)
        return {
          'gold': goldOz / 31.1035,
          'silver': silverOz / 31.1035,
        };
      }
    } catch (e) {
      // fallback
    }
    return {
      'gold': _fallbackGoldPrice,
      'silver': _fallbackSilverPrice,
    };
  }
}
