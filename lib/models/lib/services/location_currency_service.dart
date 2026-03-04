import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationCurrencyService {
  static const Map<String, Map<String, String>> _currencyMap = {
    'IN': {'code': 'INR', 'symbol': '₹', 'name': 'Indian Rupee'},
    'US': {'code': 'USD', 'symbol': '\$', 'name': 'US Dollar'},
    'GB': {'code': 'GBP', 'symbol': '£', 'name': 'British Pound'},
    'SA': {'code': 'SAR', 'symbol': 'SAR ', 'name': 'Saudi Riyal'},
    'AE': {'code': 'AED', 'symbol': 'AED ', 'name': 'UAE Dirham'},
    'PK': {'code': 'PKR', 'symbol': 'Rs ', 'name': 'Pakistani Rupee'},
    'BD': {'code': 'BDT', 'symbol': '৳', 'name': 'Bangladeshi Taka'},
    'ID': {'code': 'IDR', 'symbol': 'Rp ', 'name': 'Indonesian Rupiah'},
    'MY': {'code': 'MYR', 'symbol': 'RM ', 'name': 'Malaysian Ringgit'},
    'TR': {'code': 'TRY', 'symbol': '₺', 'name': 'Turkish Lira'},
    'EG': {'code': 'EGP', 'symbol': 'E£ ', 'name': 'Egyptian Pound'},
    'NG': {'code': 'NGN', 'symbol': '₦', 'name': 'Nigerian Naira'},
    'MA': {'code': 'MAD', 'symbol': 'MAD ', 'name': 'Moroccan Dirham'},
    'DE': {'code': 'EUR', 'symbol': '€', 'name': 'Euro'},
    'FR': {'code': 'EUR', 'symbol': '€', 'name': 'Euro'},
    'AU': {'code': 'AUD', 'symbol': 'A\$ ', 'name': 'Australian Dollar'},
    'CA': {'code': 'CAD', 'symbol': 'C\$ ', 'name': 'Canadian Dollar'},
    'QA': {'code': 'QAR', 'symbol': 'QAR ', 'name': 'Qatari Riyal'},
    'KW': {'code': 'KWD', 'symbol': 'KD ', 'name': 'Kuwaiti Dinar'},
    'OM': {'code': 'OMR', 'symbol': 'OMR ', 'name': 'Omani Rial'},
    'BH': {'code': 'BHD', 'symbol': 'BD ', 'name': 'Bahraini Dinar'},
    'ZA': {'code': 'ZAR', 'symbol': 'R ', 'name': 'South African Rand'},
  };

  Future<Map<String, String>> detectCurrencyFromGPS() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        return _currencyMap['IN']!;
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        String? countryCode =
            placemarks.first.isoCountryCode?.toUpperCase();
        debugPrint('Detected country: $countryCode');
        if (countryCode != null &&
            _currencyMap.containsKey(countryCode)) {
          return _currencyMap[countryCode]!;
        }
      }
    } catch (e) {
      debugPrint('Location detection error: $e');
    }
    return _currencyMap['IN']!;
  }

  static List<Map<String, String>> getAllCurrencies() {
    final seen = <String>{};
    return _currencyMap.values
        .where((c) => seen.add(c['code']!))
        .toList();
  }
}
