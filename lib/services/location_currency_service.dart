import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationCurrencyService {
  Future<Map<String, String>> detectCurrencyFromGPS() async {
    try {
      final response = await http
          .get(Uri.parse('https://ipapi.co/json/'))
          .timeout(const Duration(seconds: 8));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final code = data['currency'] ?? 'USD';
        final found = getAllCurrencies()
            .firstWhere((c) => c['code'] == code,
                orElse: () => {'code': 'USD', 'symbol': '\$', 'name': 'US Dollar'});
        return found;
      }
    } catch (_) {}
    return {'code': 'USD', 'symbol': '\$', 'name': 'US Dollar'};
  }

  static List<Map<String, String>> getAllCurrencies() {
    return [
      {'code': 'USD', 'symbol': '\$',  'name': 'US Dollar'},
      {'code': 'EUR', 'symbol': '€',  'name': 'Euro'},
      {'code': 'GBP', 'symbol': '£',  'name': 'British Pound'},
      {'code': 'INR', 'symbol': '₹',  'name': 'Indian Rupee'},
      {'code': 'PKR', 'symbol': '₨',  'name': 'Pakistani Rupee'},
      {'code': 'BDT', 'symbol': '৳',  'name': 'Bangladeshi Taka'},
      {'code': 'SAR', 'symbol': '﷼',  'name': 'Saudi Riyal'},
      {'code': 'AED', 'symbol': 'د.إ','name': 'UAE Dirham'},
      {'code': 'MYR', 'symbol': 'RM', 'name': 'Malaysian Ringgit'},
      {'code': 'IDR', 'symbol': 'Rp', 'name': 'Indonesian Rupiah'},
      {'code': 'TRY', 'symbol': '₺',  'name': 'Turkish Lira'},
      {'code': 'EGP', 'symbol': 'E£', 'name': 'Egyptian Pound'},
      {'code': 'CAD', 'symbol': 'CA\$','name': 'Canadian Dollar'},
      {'code': 'AUD', 'symbol': 'A\$','name': 'Australian Dollar'},
      {'code': 'QAR', 'symbol': 'QR', 'name': 'Qatari Riyal'},
      {'code': 'KWD', 'symbol': 'KD', 'name': 'Kuwaiti Dinar'},
      {'code': 'OMR', 'symbol': 'OMR','name': 'Omani Rial'},
      {'code': 'BHD', 'symbol': 'BD', 'name': 'Bahraini Dinar'},
      {'code': 'JOD', 'symbol': 'JD', 'name': 'Jordanian Dinar'},
      {'code': 'NGN', 'symbol': '₦',  'name': 'Nigerian Naira'},
    ];
  }
}
