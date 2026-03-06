import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/zakat_calculator_service.dart';
import '../l10n/app_strings.dart';

class ExplanationCard extends StatelessWidget {
  final String currencySymbol;
  final double goldPrice;
  final double silverPrice;
  final bool isLoading;
  final NumberFormat fmt;
  final AppStrings strings;

  const ExplanationCard({
    super.key,
    required this.currencySymbol,
    required this.goldPrice,
    required this.silverPrice,
    required this.isLoading,
    required this.fmt,
    required this.strings,
  });

  @override
  Widget build(BuildContext context) {
    final goldNisabValue =
        ZakatCalculatorService.goldNisabGrams * goldPrice;
    final silverNisabValue =
        ZakatCalculatorService.silverNisabGrams * silverPrice;

    return Card(
      color: Colors.green[50],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.whatIsZakat,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 6),
            Text(strings.zakatDesc,
                style: const TextStyle(
                    fontSize: 12, color: Colors.black87)),
            const SizedBox(height: 10),
            if (!isLoading && goldPrice > 0) ...[
              _InfoRow(
                  label: strings.zakatRate,
                  value: strings.zakatRateValue),
              _InfoRow(
                  label: strings.goldNisabLabel,
                  value: strings.goldNisabGrams),
              _InfoRow(
                  label: strings.silverNisabLabel,
                  value: strings.silverNisabGrams),
              if (goldNisabValue > 0)
                _InfoRow(
                    label: strings.goldNisabValue,
                    value:
                        '$currencySymbol ${fmt.format(goldNisabValue)}'),
              if (silverNisabValue > 0)
                _InfoRow(
                    label: strings.silverNisabValue,
                    value:
                        '$currencySymbol ${fmt.format(silverNisabValue)}'),
              const SizedBox(height: 4),
              Text(strings.nisabNote,
                  style: TextStyle(
                      fontSize: 10, color: Colors.grey[600])),
            ] else ...[
              Text(strings.enterPricesHint,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black54)),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label, value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontSize: 12, color: Colors.black54)),
          ),
          Text(value,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
