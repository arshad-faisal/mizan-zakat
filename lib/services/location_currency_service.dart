import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationCurrencyService {
  static const Map<String, Map<String, String>> _countryCurrencyMap = {
    'PK': {'code': 'PKR', 'symbol': '₨', 'name': 'Pakistani Rupee'},
    'IN': {'code': 'INR', 'symbol': '₹', 'name': 'Indian Rupee'},
    'US': {'code': 'USD', 'symbol': '\$', 'name': 'US Dollar'},
    'GB': {'code': 'GBP', 'symbol': '£', 'name': 'British Pound'},
    'SA': {'code': 'SAR', 'symbol': '﷼', 'name': 'Saudi Riyal'},
    'AE': {'code': 'AED', 'symbol': 'د.إ', 'name': 'UAE Dirham'},
    'BD': {'code': 'BDT', 'symbol': '৳', 'name': 'Bangladeshi Taka'},
    'MY': {'code': 'MYR', 'symbol': 'RM', 'name': 'Malaysian Ringgit'},
    'ID': {'code': 'IDR', 'symbol': 'Rp', 'name': 'Indonesian Rupiah'},
    'TR': {'code': 'TRY', 'symbol': '₺', 'name': 'Turkish Lira'},
    'EG': {'code': 'EGP', 'symbol': 'E£', 'name': 'Egyptian Pound'},
    'NG': {'code': 'NGN', 'symbol': '₦', 'name': 'Nigerian Naira'},
    'MA': {'code': 'MAD', 'symbol': 'د.م.', 'name': 'Moroccan Dirham'},
    'EU': {'code': 'EUR', 'symbol': '€', 'name': 'Euro'},
    'CA': {'code': 'CAD', 'symbol': 'C\$', 'name': 'Canadian Dollar'},
    'AU': {'code': 'AUD', 'symbol': 'A\$', 'name': 'Australian Dollar'},
  };

  static List<Map<String, String>> getAllCurrencies() {
    return _countryCurrencyMap.values.toList();
  }

  static Future<Map<String, String>> detectCurrencyFromLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return _defaultCurrency();

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return _defaultCurrency();
      }
      if (permission == LocationPermission.deniedForever) return _defaultCurrency();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        String? countryCode = placemarks.first.isoCountryCode;
        if (countryCode != null && _countryCurrencyMap.containsKey(countryCode)) {
          return _countryCurrencyMap[countryCode]!;
        }
      }
    } catch (e) {
      // fallback to default
    }
    return _defaultCurrency();
  }

  static Map<String, String> _defaultCurrency() {
    return {'code': 'USD', 'symbol': '\$', 'name': 'US Dollar'};
  }
}
