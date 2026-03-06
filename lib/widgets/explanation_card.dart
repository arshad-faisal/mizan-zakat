import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/zakat_calculator_service.dart';

class ExplanationCard extends StatelessWidget {
  final String currencyCode;
  final String currencySymbol;
  final double goldPrice;
  final double silverPrice;
  final bool isLoading;
  final NumberFormat fmt;

  const ExplanationCard({
    super.key,
    required this.currencyCode,
    required this.currencySymbol,
    required this.goldPrice,
    required this.silverPrice,
    required this.isLoading,
    required this.fmt,
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
            const Text('📖 What is Zakat?',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 6),
            const Text(
              'Zakat is the 3rd Pillar of Islam — an annual 2.5% charity on wealth held for one full lunar year (Hawl), if it exceeds the Nisab (minimum threshold).',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            if (!isLoading && goldPrice > 0) ...[
              _InfoRow(
                  label: '⚖️ Zakat Rate',
                  value: '2.5% of Net Wealth'),
              _InfoRow(
                  label: '🥇 Gold Nisab',
                  value:
                      '${fmt.format(ZakatCalculatorService.goldNisabGrams)} grams of gold'),
              _InfoRow(
                  label: '🥈 Silver Nisab',
                  value:
                      '${fmt.format(ZakatCalculatorService.silverNisabGrams)} grams of silver'),
              if (goldNisabValue > 0)
                _InfoRow(
                    label: '💰 Gold Nisab Value',
                    value:
                        '$currencySymbol ${fmt.format(goldNisabValue)}'),
              if (silverNisabValue > 0)
                _InfoRow(
                    label: '💰 Silver Nisab Value',
                    value:
                        '$currencySymbol ${fmt.format(silverNisabValue)}'),
              const SizedBox(height: 4),
              Text(
                '* Silver Nisab is used (recommended — more inclusive per Hanafi school)',
                style:
                    TextStyle(fontSize: 10, color: Colors.grey[600]),
              ),
            ] else ...[
              const Text(
                'Enter gold & silver prices above to see current Nisab values.',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
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
          Text(label,
              style: const TextStyle(
                  fontSize: 12, color: Colors.black54)),
          Text(value,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
