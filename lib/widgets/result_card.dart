import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../models/zakat_model.dart';

class ResultCard extends StatelessWidget {
  final ZakatResult result;
  final NumberFormat fmt;

  const ResultCard({super.key, required this.result, required this.fmt});

  void _shareResult() {
    final s = result.currencySymbol;
    final text = '''
🌙 Mizan Zakat — My Calculation
━━━━━━━━━━━━━━━━━━
Total Assets:    $s ${fmt.format(result.totalAssets)}
Liabilities:     − $s ${fmt.format(result.outstandingDebts)}
Net Wealth:      $s ${fmt.format(result.totalWealth)}
Nisab (Silver):  $s ${fmt.format(result.nisabUsed)}
━━━━━━━━━━━━━━━━━━
${result.meetsNisab ? '✅ Zakat Due: $s ${fmt.format(result.zakatAmount)} (2.5%)' : '⚠️ Zakat Not Due This Year'}
━━━━━━━━━━━━━━━━━━
Calculated with Mizan Zakat App 🤲
In memory of Mohammad Ibrahim (Nana) & Mohammad Aslam (Dada) رحمهم الله''';

    Share.share(text, subject: '🌙 My Zakat Calculation — Mizan Zakat');
  }

  @override
  Widget build(BuildContext context) {
    final s = result.currencySymbol;
    return Column(
      children: [
        // Main result
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: result.meetsNisab
                ? const Color(0xFF1B5E20)
                : Colors.orange[800],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                result.meetsNisab
                    ? '🌙 Zakat is Due'
                    : '✅ No Zakat Due This Year',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (result.meetsNisab) ...[
                Text(
                  '$s ${fmt.format(result.zakatAmount)}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Zakatable Wealth: $s ${fmt.format(result.totalWealth)}',
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 13),
                ),
              ] else ...[
                const SizedBox(height: 6),
                Text(
                  'Your wealth ($s ${fmt.format(result.totalWealth)}) is below Nisab ($s ${fmt.format(result.nisabUsed)})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 13),
                ),
              ],
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: _shareResult,
                icon: const Icon(Icons.share,
                    color: Colors.white, size: 18),
                label: const Text('Share My Calculation',
                    style:
                        TextStyle(color: Colors.white, fontSize: 13)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Nisab card
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('📊 Nisab Thresholds',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 8),
                _NisabRow(
                    label: '🥇 Gold Nisab (87.48g)',
                    value: '$s ${fmt.format(result.goldNisab)}'),
                _NisabRow(
                    label: '🥈 Silver Nisab (612.36g)',
                    value: '$s ${fmt.format(result.silverNisab)}'),
                const Divider(),
                _NisabRow(
                    label: 'Nisab Used (Silver — Hanafi)',
                    value: '$s ${fmt.format(result.nisabUsed)}',
                    bold: true),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Breakdown card
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🧾 Wealth Breakdown',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 8),
                ...result.breakdown.entries
                    .where((e) => e.value > 0)
                    .map((e) => _BreakdownRow(
                          label: e.key,
                          value: '$s ${fmt.format(e.value)}',
                        )),
                if (result.outstandingDebts > 0) ...[
                  const Divider(),
                  _BreakdownRow(
                    label: '📉 Outstanding Debts',
                    value: '− $s ${fmt.format(result.outstandingDebts)}',
                    isDeduction: true,
                  ),
                ],
                const Divider(),
                _BreakdownRow(
                  label: 'Net Zakatable Wealth',
                  value: '$s ${fmt.format(result.totalWealth)}',
                  bold: true,
                ),
                _BreakdownRow(
                  label: 'Zakat Due (2.5%)',
                  value: result.meetsNisab
                      ? '$s ${fmt.format(result.zakatAmount)}'
                      : 'Not Due',
                  bold: true,
                  highlight: result.meetsNisab,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NisabRow extends StatelessWidget {
  final String label, value;
  final bool bold;
  const _NisabRow(
      {required this.label, required this.value, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        bold ? FontWeight.bold : FontWeight.normal)),
          ),
          Text(value,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight:
                      bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class _BreakdownRow extends StatelessWidget {
  final String label, value;
  final bool bold, isDeduction, highlight;
  const _BreakdownRow({
    required this.label,
    required this.value,
    this.bold = false,
    this.isDeduction = false,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: isDeduction ? Colors.red[700] : null,
                    fontWeight:
                        bold ? FontWeight.bold : FontWeight.normal)),
          ),
          Text(value,
              style: TextStyle(
                  fontSize: 12,
                  color: highlight
                      ? const Color(0xFF1B5E20)
                      : isDeduction
                          ? Colors.red[700]
                          : null,
                  fontWeight:
                      bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
