import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationCurrencyService {
  Future<String> detectCurrencyFromGPS() async {
    try {
      final response = await http.get(
        Uri.parse('https://ipapi.co/json/'),
      ).timeout(const Duration(seconds: 8));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['currency'] ?? 'USD';
      }
    } catch (e) {
      // fallback
    }
    return 'USD';
  }
}
