import 'dart:convert';
import 'package:http/http.dart' as http;

class GoldPriceService {
  // Approximate fallback prices per gram in USD (updated March 2026)
  static const double _fallbackGold = 97.48;
  static const double _fallbackSilver = 1.07;

  Future<Map<String, double>> fetchMetalPricesUSD() async {
    // Try primary API
    try {
      final res = await http
          .get(Uri.parse('https://api.metals.live/v1/spot/gold,silver'))
          .timeout(const Duration(seconds: 8));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return {
          'goldPerGram': (data[0]['price'] as num).toDouble() / 31.1035,
          'silverPerGram': (data[1]['price'] as num).toDouble() / 31.1035,
        };
      }
    } catch (_) {}

    // Try secondary API
    try {
      final res = await http
          .get(Uri.parse(
              'https://forex-data-feed.swissquote.com/public-quotes/bboquotes/instrument/XAU/USD'))
          .timeout(const Duration(seconds: 8));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final goldOz = (data[0]['spreadProfilePrices'][0]['ask'] as num).toDouble();
        return {
          'goldPerGram': goldOz / 31.1035,
          'silverPerGram': _fallbackSilver,
        };
      }
    } catch (_) {}

    // Hardcoded reasonable fallback (March 2026 approximate)
    return {
      'goldPerGram': _fallbackGold,
      'silverPerGram': _fallbackSilver,
    };
  }

  Future<double> fetchExchangeRate(String currencyCode) async {
    if (currencyCode == 'USD') return 1.0;

    // Primary: Frankfurter (free, no key, very reliable)
    try {
      final res = await http
          .get(Uri.parse(
              'https://api.frankfurter.app/latest?from=USD&to=$currencyCode'))
          .timeout(const Duration(seconds: 8));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return (data['rates'][currencyCode] as num).toDouble();
      }
    } catch (_) {}

    // Secondary fallback
    try {
      final res = await http
          .get(Uri.parse('https://open.er-api.com/v6/latest/USD'))
          .timeout(const Duration(seconds: 8));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final rates = data['rates'] as Map<String, dynamic>;
        return (rates[currencyCode] as num?)?.toDouble() ?? 1.0;
      }
    } catch (_) {}

    // Hardcoded fallback rates (approximate March 2026)
    const fallbackRates = {
      'INR': 92.14,
      'PKR': 278.0,
      'BDT': 110.0,
      'SAR': 3.75,
      'AED': 3.67,
      'MYR': 4.48,
      'GBP': 0.79,
      'EUR': 0.92,
      'CAD': 1.36,
      'AUD': 1.55,
      'TRY': 32.0,
      'EGP': 48.0,
      'IDR': 15800.0,
      'QAR': 3.64,
      'KWD': 0.31,
      'OMR': 0.38,
      'BHD': 0.38,
      'JOD': 0.71,
      'NGN': 1550.0,
    };
    return fallbackRates[currencyCode] ?? 1.0;
  }
}
