import '../models/zakat_model.dart';

class ZakatCalculatorService {
  static const double goldNisabGrams = 87.48;
  static const double silverNisabGrams = 612.36;
  static const double zakatRate = 0.025;

  ZakatResult calculate({
    required ZakatAssets assets,
    required double goldPricePerGram,
    required double silverPricePerGram,
    required String currencySymbol,
    required String currencyCode,
  }) {
    final goldValue = assets.goldGrams * goldPricePerGram;
    final silverValue = assets.silverGrams * silverPricePerGram;

    final breakdown = <String, double>{
      'Cash at Home': assets.cashAtHome,
      'Bank Accounts': assets.cashInBank,
      'Gold': goldValue,
      'Silver': silverValue,
      'Business Inventory': assets.businessInventory,
      'Stocks & Investments': assets.investments,
      'Money Owed to You': assets.moneyOwedToYou,
      'Property for Resale': assets.propertyForResale,
      'Net Rental Income': assets.netRentalIncome,
      'Investment Land': assets.investmentLand,
      'Property Business Stock': assets.propertyBusinessStock,
    };

    final totalAssets = breakdown.values.fold(0.0, (a, b) => a + b);
    final totalWealth = totalAssets - assets.outstandingDebts;
    final goldNisab = goldNisabGrams * goldPricePerGram;
    final silverNisab = silverNisabGrams * silverPricePerGram;
    final nisabUsed = silverNisab;
    final meetsNisab = totalWealth >= nisabUsed;
    final zakatAmount = meetsNisab ? totalWealth * zakatRate : 0.0;

    return ZakatResult(
      totalWealth: totalWealth,
      goldNisab: goldNisab,
      silverNisab: silverNisab,
      nisabUsed: nisabUsed,
      zakatAmount: zakatAmount,
      meetsNisab: meetsNisab,
      currencySymbol: currencySymbol,
      currencyCode: currencyCode,
      breakdown: breakdown,
    );
  }
}
