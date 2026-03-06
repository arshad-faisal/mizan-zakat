class ZakatAssets {
  final double cashAtHome;
  final double cashInBank;
  final double goldGrams;
  final double silverGrams;
  final double businessInventory;
  final double investments;
  final double moneyOwedToYou;
  final double outstandingDebts;
  final double propertyForResale;
  final double netRentalIncome;
  final double investmentLand;
  final double propertyBusinessStock;

  const ZakatAssets({
    this.cashAtHome = 0,
    this.cashInBank = 0,
    this.goldGrams = 0,
    this.silverGrams = 0,
    this.businessInventory = 0,
    this.investments = 0,
    this.moneyOwedToYou = 0,
    this.outstandingDebts = 0,
    this.propertyForResale = 0,
    this.netRentalIncome = 0,
    this.investmentLand = 0,
    this.propertyBusinessStock = 0,
  });
}

class ZakatResult {
  final double totalWealth;
  final double totalAssets;
  final double outstandingDebts;
  final double goldNisab;
  final double silverNisab;
  final double nisabUsed;
  final double zakatAmount;
  final bool meetsNisab;
  final String currencySymbol;
  final String currencyCode;
  final Map<String, double> breakdown;

  const ZakatResult({
    required this.totalWealth,
    required this.totalAssets,
    required this.outstandingDebts,
    required this.goldNisab,
    required this.silverNisab,
    required this.nisabUsed,
    required this.zakatAmount,
    required this.meetsNisab,
    required this.currencySymbol,
    required this.currencyCode,
    required this.breakdown,
  });
}
