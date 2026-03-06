import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/location_currency_service.dart';
import '../services/zakat_calculator_service.dart';
import '../models/zakat_model.dart';
import '../widgets/asset_input_card.dart';
import '../widgets/result_card.dart';
import '../widgets/explanation_card.dart';
import '../l10n/app_strings.dart';
import 'about_screen.dart';

class ZakatCalculatorScreen extends StatefulWidget {
  final AppLanguage language;
  const ZakatCalculatorScreen(
      {super.key, this.language = AppLanguage.english});

  @override
  State<ZakatCalculatorScreen> createState() =>
      _ZakatCalculatorScreenState();
}

class _ZakatCalculatorScreenState
    extends State<ZakatCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final _resultKey = GlobalKey();
  final _calculatorService = ZakatCalculatorService();
  final _locationService = LocationCurrencyService();

  late AppLanguage _language;
  String _currencySymbol = '₹';
  String _currencyCode = 'INR';
  String _currencyName = 'Indian Rupee';
  bool _isLoadingLocation = true;

  final _goldPriceCtrl = TextEditingController();
  final _silverPriceCtrl = TextEditingController();
  final _cashHomeCtrl = TextEditingController();
  final _cashBankCtrl = TextEditingController();
  final _goldGramsCtrl = TextEditingController();
  final _silverGramsCtrl = TextEditingController();
  final _businessCtrl = TextEditingController();
  final _investmentsCtrl = TextEditingController();
  final _receivablesCtrl = TextEditingController();
  final _propertyResaleCtrl = TextEditingController();
  final _rentalIncomeCtrl = TextEditingController();
  final _investmentLandCtrl = TextEditingController();
  final _propertyStockCtrl = TextEditingController();
  final _debtsCtrl = TextEditingController();

  ZakatResult? _result;

  @override
  void initState() {
    super.initState();
    _language = widget.language;
    _initApp();
  }

  Future<void> _initApp() async {
    final currency = await _locationService.detectCurrencyFromGPS();
    setState(() {
      _currencySymbol = currency['symbol']!;
      _currencyCode = currency['code']!;
      _currencyName = currency['name']!;
      _isLoadingLocation = false;
    });
  }

  void _changeCurrency(String code, String symbol, String name) {
    setState(() {
      _currencyCode = code;
      _currencySymbol = symbol;
      _currencyName = name;
      _result = null;
      _goldPriceCtrl.clear();
      _silverPriceCtrl.clear();
    });
  }

  void _calculateZakat() {
    FocusScope.of(context).unfocus();
    final s = AppStrings(_language);
    double parse(TextEditingController c) =>
        double.tryParse(c.text.replaceAll(',', '')) ?? 0;

    final goldPrice = parse(_goldPriceCtrl);
    final silverPrice = parse(_silverPriceCtrl);

    if (goldPrice <= 0 || silverPrice <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(s.metalPriceError),
        backgroundColor: Colors.red,
      ));
      return;
    }

    final assets = ZakatAssets(
      cashAtHome: parse(_cashHomeCtrl),
