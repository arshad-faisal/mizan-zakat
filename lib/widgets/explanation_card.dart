import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExplanationCard extends StatelessWidget {
  final String currencyCode;
  final double goldPrice;
  final double silverPrice;
  final bool isLoading;
  final String currencySymbol;
  final NumberFormat fmt;

  const ExplanationCard({
    super.key,
    required this.currencyCode,
    required this.goldPrice,
    required this.silverPrice,
    required this.isLoading,
    required this.currencySymbol,
    required this.fmt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1B5E20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📖 What is Zakat?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Zakat is the 3rd Pillar of Islam — an annual 2.5% charity on wealth held for one full lunar year (Hawl), if it exceeds the Nisab (minimum threshold).',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _InfoRow(
                    label: 'Zakat Rate',
                    value: '2.5% of Net Wealth',
                    icon: Icons.percent,
                  ),
                  const Divider(color: Colors.white30, height: 16),
                  _InfoRow(
                    label: 'Gold Nisab',
                    value: '87.48 grams of gold',
                    icon: Icons.circle,
                    iconColor: Colors.amber,
                  ),
                  const Divider(color: Colors.white30, height: 16),
                  _InfoRow(
                    label: 'Silver Nisab',
                    value: '612.36 grams of silver',
                    icon: Icons.circle,
                    iconColor: Colors.grey[300]!,
                  ),
                  if (!isLoading) ...[
                    const Divider(color: Colors.white30, height: 16),
                    _InfoRow(
                      label: 'Silver Nisab Today',
                      value:
                          '$currencySymbol ${fmt.format(612.36 * silverPrice)}',
                      icon: Icons.today,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '* Silver Nisab is used for mixed assets — recommended by majority of scholars.',
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? iconColor;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: iconColor ?? Colors.white),
        const SizedBox(width: 8),
        Expanded(
          child: Text(label,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 13)),
        ),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13)),
      ],
    );
  }
}
