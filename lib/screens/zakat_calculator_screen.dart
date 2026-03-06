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
      cashInBank: parse(_cashBankCtrl),
      goldGrams: parse(_goldGramsCtrl),
      silverGrams: parse(_silverGramsCtrl),
      businessInventory: parse(_businessCtrl),
      investments: parse(_investmentsCtrl),
      moneyOwedToYou: parse(_receivablesCtrl),
      outstandingDebts: parse(_debtsCtrl),
      propertyForResale: parse(_propertyResaleCtrl),
      netRentalIncome: parse(_rentalIncomeCtrl),
      investmentLand: parse(_investmentLandCtrl),
      propertyBusinessStock: parse(_propertyStockCtrl),
    );

    final result = _calculatorService.calculate(
      assets: assets,
      goldPricePerGram: goldPrice,
      silverPricePerGram: silverPrice,
      currencySymbol: _currencySymbol,
      currencyCode: _currencyCode,
    );

    setState(() => _result = result);

    Future.delayed(const Duration(milliseconds: 400), () {
      if (_resultKey.currentContext != null) {
        Scrollable.ensureVisible(_resultKey.currentContext!,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut);
      }
    });
  }

  void _resetForm() {
    setState(() {
      _goldPriceCtrl.clear();
      _silverPriceCtrl.clear();
      _cashHomeCtrl.clear();
      _cashBankCtrl.clear();
      _goldGramsCtrl.clear();
      _silverGramsCtrl.clear();
      _businessCtrl.clear();
      _investmentsCtrl.clear();
      _receivablesCtrl.clear();
      _propertyResaleCtrl.clear();
      _rentalIncomeCtrl.clear();
      _investmentLandCtrl.clear();
      _propertyStockCtrl.clear();
      _debtsCtrl.clear();
      _result = null;
    });
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _goldPriceCtrl.dispose();
    _silverPriceCtrl.dispose();
    _cashHomeCtrl.dispose();
    _cashBankCtrl.dispose();
    _goldGramsCtrl.dispose();
    _silverGramsCtrl.dispose();
    _businessCtrl.dispose();
    _investmentsCtrl.dispose();
    _receivablesCtrl.dispose();
    _propertyResaleCtrl.dispose();
    _rentalIncomeCtrl.dispose();
    _investmentLandCtrl.dispose();
    _propertyStockCtrl.dispose();
    _debtsCtrl.dispose();
    super.dispose();
  }

  CrossAxisAlignment get _crossAlign => _language == AppLanguage.urdu
      ? CrossAxisAlignment.end
      : CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,##0.00');
    final s = AppStrings(_language);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(s.appTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Text(s.appSubtitle,
                style: const TextStyle(
                    color: Colors.white54, fontSize: 10)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline,
                color: Colors.white),
            tooltip: 'About',
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        AboutScreen(language: _language))),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: 'Reset',
            onPressed: _resetForm,
          ),
          PopupMenuButton<Map<String, String>>(
            icon: Row(
              children: [
                const Icon(Icons.language,
                    color: Colors.white, size: 20),
                const SizedBox(width: 2),
                Text(_currencyCode,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 11)),
              ],
            ),
            onSelected: (currency) => _changeCurrency(
              currency['code']!,
              currency['symbol']!,
              currency['name']!,
            ),
            itemBuilder: (ctx) =>
                LocationCurrencyService.getAllCurrencies()
                    .map((c) => PopupMenuItem(
                          value: c,
                          child: Text(
                              '${c['symbol']} ${c['name']} (${c['code']})'),
                        ))
                    .toList(),
          ),
        ],
      ),
      body: _isLoadingLocation
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                      color: Color(0xFF1B5E20)),
                  const SizedBox(height: 20),
                  Text(s.loading,
                      style: const TextStyle(
                          color: Color(0xFF1B5E20),
                          fontSize: 15)),
                ],
              ),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: _crossAlign,
                  children: [
                    // Currency banner
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.green[300]!),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Color(0xFF1B5E20), size: 18),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              s.currencyBanner(
                                  _currencyName, _currencyCode),
                              textAlign: _language ==
                                      AppLanguage.urdu
                                  ? TextAlign.right
                                  : TextAlign.left,
                              style: const TextStyle(
                                  color: Color(0xFF1B5E20),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    ExplanationCard(
                      goldPrice:
                          double.tryParse(_goldPriceCtrl.text) ??
                              0,
                      silverPrice:
                          double.tryParse(_silverPriceCtrl.text) ??
                              0,
                      isLoading: false,
                      currencySymbol: _currencySymbol,
                      fmt: fmt,
                      strings: s,
                    ),
                    const SizedBox(height: 12),

                    // Metal prices
                    Card(
                      color: Colors.amber[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: _crossAlign,
                          children: [
                            Text(s.metalPricesTitle,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(s.metalPricesHint,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[600])),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: _MetalPriceInput(
                                    label: s.goldPerGram,
                                    controller: _goldPriceCtrl,
                                    symbol: _currencySymbol,
                                    color: Colors.amber[100]!,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _MetalPriceInput(
                                    label: s.silverPerGram,
                                    controller: _silverPriceCtrl,
                                    symbol: _currencySymbol,
                                    color: Colors.grey[100]!,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    SectionHeader(title: s.sectionCash),
                    AssetInputCard(
                        label: s.cashAtHome,
                        hint: s.cashAtHomeHint,
                        controller: _cashHomeCtrl,
                        symbol: _currencySymbol),
                    AssetInputCard(
                        label: s.bankAccounts,
                        hint: s.bankAccountsHint,
                        controller: _cashBankCtrl,
                        symbol: _currencySymbol),

                    SectionHeader(title: s.sectionGold),
                    AssetInputCard(
                        label: s.goldOwned,
                        hint: s.goldOwnedHint,
                        controller: _goldGramsCtrl,
                        symbol: 'g',
                        isGrams: true),
                    AssetInputCard(
                        label: s.silverOwned,
                        hint: s.silverOwnedHint,
                        controller: _silverGramsCtrl,
                        symbol: 'g',
                        isGrams: true),

                    SectionHeader(title: s.sectionBusiness),
                    AssetInputCard(
                        label: s.businessInventory,
                        hint: s.businessInventoryHint,
                        controller: _businessCtrl,
                        symbol: _currencySymbol),
                    AssetInputCard(
                        label: s.stocksInvestments,
                        hint: s.stocksInvestmentsHint,
                        controller: _investmentsCtrl,
                        symbol: _currencySymbol),
                    AssetInputCard(
                        label: s.moneyOwed,
                        hint: s.moneyOwedHint,
                        controller: _receivablesCtrl,
                        symbol: _currencySymbol),

                    SectionHeader(title: s.sectionProperty),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.blue[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline,
                              size: 16, color: Colors.blue[700]),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(s.propertyExemptNote,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                    AssetInputCard(
                        label: s.propertyResale,
                        hint: s.propertyResaleHint,
                        controller: _propertyResaleCtrl,
                        symbol: _currencySymbol),
                    AssetInputCard(
                        label: s.rentalIncome,
                        hint: s.rentalIncomeHint,
                        controller: _rentalIncomeCtrl,
                        symbol: _currencySymbol),
                    AssetInputCard(
                        label: s.investmentLand,
                        hint: s.investmentLandHint,
                        controller: _investmentLandCtrl,
                        symbol: _currencySymbol),
                    AssetInputCard(
                        label: s.propertyStock,
                        hint: s.propertyStockHint,
                        controller: _propertyStockCtrl,
                        symbol: _currencySymbol),

                    SectionHeader(title: s.sectionDebts),
                    AssetInputCard(
                        label: s.outstandingDebts,
                        hint: s.outstandingDebtsHint,
                        controller: _debtsCtrl,
                        symbol: _currencySymbol,
                        isDeduction: true),

                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _calculateZakat,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF1B5E20),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(14)),
                          elevation: 3,
                        ),
                        icon: const Icon(Icons.calculate,
                            size: 24),
                        label: Text(s.calculateBtn,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 28),

                    if (_result != null) ...[
                      SizedBox(key: _resultKey, height: 1),
                      ResultCard(
                          result: _result!,
                          fmt: fmt,
                          strings: s),
                    ],

                    const SizedBox(height: 40),
                    Center(
                      child: Column(
                        children: [
                          Text(s.mayAllahAccept,
                              style: const TextStyle(
                                  color: Color(0xFF1B5E20),
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(s.footerMemory,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 11)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}

class _MetalPriceInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String symbol;
  final Color color;

  const _MetalPriceInput({
    required this.label,
    required this.controller,
    required this.symbol,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 11, color: Colors.black54)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('$symbol ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(
                          decimal: true),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: '0.00',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
