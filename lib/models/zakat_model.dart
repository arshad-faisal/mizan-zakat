class ZakatAssets {
  double cashAtHome;
  double cashInBank;
  double goldGrams;
  double silverGrams;
  double businessInventory;
  double investments;
  double moneyOwedToYou;
  double outstandingDebts;

  ZakatAssets({
    this.cashAtHome = 0,
    this.cashInBank = 0,
    this.goldGrams = 0,
    this.silverGrams = 0,
    this.businessInventory = 0,
    this.investments = 0,
    this.moneyOwedToYou = 0,
    this.outstandingDebts = 0,
  });
}

class ZakatResult {
  final double totalAssets;
  final double totalLiabilities;
  final double netWealth;
  final double nisabGold;
  final double nisabSilver;
  final double nisabUsed;
  final bool meetsNisab;
  final double zakatAmount;
  final String currencySymbol;
  final String currencyCode;
  final double goldPricePerGram;
  final double silverPricePerGram;
  final double goldValue;
  final double silverValue;

  const ZakatResult({
    required this.totalAssets,
    required this.totalLiabilities,
    required this.netWealth,
    required this.nisabGold,
    required this.nisabSilver,
    required this.nisabUsed,
    required this.meetsNisab,
    required this.zakatAmount,
    required this.currencySymbol,
    required this.currencyCode,
    required this.goldPricePerGram,
    required this.silverPricePerGram,
    required this.goldValue,
    required this.silverValue,
  });
}
