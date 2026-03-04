import '../models/zakat_model.dart';

class ZakatCalculatorService {
  static const double nisabGoldGrams = 87.48;
  static const double nisabSilverGrams = 612.36;
  static const double zakatRate = 0.025;

  ZakatResult calculate({
    required ZakatAssets assets,
    required double goldPricePerGram,
    required double silverPricePerGram,
    required String currencySymbol,
    required String currencyCode,
  }) {
    double nisabGoldValue = nisabGoldGrams * goldPricePerGram;
    double nisabSilverValue = nisabSilverGrams * silverPricePerGram;

    double goldValue = assets.goldGrams * goldPricePerGram;
    double silverValue = assets.silverGrams * silverPricePerGram;

    double totalAssets = assets.cashAtHome +
        assets.cashInBank +
        goldValue +
        silverValue +
        assets.businessInventory +
        assets.investments +
        assets.moneyOwedToYou;

    double netWealth = totalAssets - assets.outstandingDebts;
    if (netWealth < 0) netWealth = 0;

    double nisabUsed = nisabSilverValue;
    bool meetsNisab = netWealth >= nisabUsed;
    double zakatAmount = meetsNisab ? netWealth * zakatRate : 0;

    return ZakatResult(
      totalAssets: totalAssets,
      totalLiabilities: assets.outstandingDebts,
      netWealth: netWealth,
      nisabGold: nisabGoldValue,
      nisabSilver: nisabSilverValue,
      nisabUsed: nisabUsed,
      meetsNisab: meetsNisab,
      zakatAmount: zakatAmount,
      currencySymbol: currencySymbol,
      currencyCode: currencyCode,
      goldPricePerGram: goldPricePerGram,
      silverPricePerGram: silverPricePerGram,
      goldValue: goldValue,
      silverValue: silverValue,
    );
  }
}
