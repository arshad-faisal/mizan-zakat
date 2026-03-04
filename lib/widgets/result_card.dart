import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../models/zakat_model.dart';

class ResultCard extends StatelessWidget {
  final ZakatResult result;
  final NumberFormat fmt;

  const ResultCard(
      {super.key, required this.result, required this.fmt});

  String get _s => result.currencySymbol;
  String _f(double v) => '$_s ${fmt.format(v)}';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: result.meetsNisab
          ? const Color(0xFFE8F5E9)
          : const Color(0xFFFFF3E0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  result.meetsNisab
                      ? Icons.check_circle
                      : Icons.info_outline,
                  color: result.meetsNisab
                      ? Colors.green[800]
                      : Colors.orange[800],
                  size: 30,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    result.meetsNisab
                        ? '✅ Zakat is Obligatory on You'
                        : '⚠️ Zakat Not Due This Year',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: result.meetsNisab
                          ? Colors.green[800]
                          : Colors.orange[800],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 28),
            const Text(
              '🧮 Full Calculation Breakdown',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20)),
            ),
            const SizedBox(height: 14),
            _StepRow(
              step: '1',
              title: 'Live Metal Prices Used',
              detail:
                  'Gold: ${_f(result.goldPricePerGram)} per gram\n'
                  'Silver: ${_f(result.silverPricePerGram)} per gram',
            ),
            _StepRow(
              step: '2',
              title: 'Nisab Thresholds',
              detail:
                  '🥇 Gold Nisab (87.48g): ${_f(result.nisabGold)}\n'
                  '🥈 Silver Nisab (612.36g): ${_f(result.nisabSilver)}\n'
                  '→ Using Silver Nisab (scholarly consensus)',
            ),
            _StepRow(
              step: '3',
              title: 'Your Zakatable Assets',
              detail: 'Gold value: ${_f(result.goldValue)}\n'
                  'Silver value: ${_f(result.silverValue)}\n'
                  'Total Assets = ${_f(result.totalAssets)}',
            ),
            _StepRow(
              step: '4',
              title: 'Deductions',
              detail:
                  'Outstanding debts: − ${_f(result.totalLiabilities)}',
            ),
            _StepRow(
              step: '5',
              title: 'Net Zakatable Wealth',
              detail:
                  '${_f(result.totalAssets)} − ${_f(result.totalLiabilities)} = ${_f(result.netWealth)}',
              isHighlight: true,
            ),
            _StepRow(
              step: '6',
              title: 'Nisab Check',
              detail: result.meetsNisab
                  ? '${_f(result.netWealth)} ≥ ${_f(result.nisabUsed)}\n✅ Zakat is OBLIGATORY'
                  : '${_f(result.netWealth)} < ${_f(result.nisabUsed)}\n⚠️ Zakat NOT due yet',
            ),
            if (result.meetsNisab)
              _StepRow(
                step: '7',
                title: 'Zakat (2.5% × Net Wealth)',
                detail:
                    '2.5% × ${_f(result.netWealth)} = ${_f(result.zakatAmount)}',
                isHighlight: true,
              ),
            const Divider(height: 28),
            if (result.meetsNisab)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5E20),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    const Text('Your Zakat Amount to Pay',
                        style: TextStyle(
                            color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 6),
                    Text(
                      _f(result.zakatAmount),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(result.currencyCode,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 12)),
                  ],
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Text(
                  'Your net wealth of ${_f(result.netWealth)} does not reach the Nisab of ${_f(result.nisabUsed)}. No Zakat is due this year. 🤲',
                  style: TextStyle(
                      color: Colors.orange[900], fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: const Row(
                children: [
                  Icon(Icons.calendar_month,
                      color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Zakat is due only if this wealth was maintained for one full lunar year (Hawl / حول).',
                      style: TextStyle(
                          fontSize: 12, color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Share.share(
                    '🌙 Mizan Zakat — My Calculation\n'
                    '━━━━━━━━━━━━━━━━━━\n'
                    'Total Assets:     ${_f(result.totalAssets)}\n'
                    'Liabilities:        − ${_f(result.totalLiabilities)}\n'
                    'Net Wealth:      ${_f(result.netWealth)}\n'
                    'Nisab (Silver):  ${_f(result.nisabSilver)}\n'
                    '━━━━━━━━━━━━━━━━━━\n'
                    '${result.meetsNisab ? '✅ Zakat Due (2.5%): ${_f(result.zakatAmount)}' : '⚠️ Zakat Not Due This Year'}\n'
                    '━━━━━━━━━━━━━━━━━━\n'
                    'Calculated with Mizan Zakat App 🤲\n'
                    'In memory of Mohammad Ibrahim (Nana) & Mohammad Aslam (Dada) رحمهم الله',
                    subject: 'My Zakat Calculation — Mizan Zakat',
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1B5E20),
                  side: const BorderSide(color: Color(0xFF1B5E20)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                icon: const Icon(Icons.share),
                label: const Text('Share My Zakat Result'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final String step, title, detail;
  final bool isHighlight;

  const _StepRow({
    required this.step,
    required this.title,
    required this.detail,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: const Color(0xFF1B5E20),
            child: Text(step,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13)),
                const SizedBox(height: 3),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isHighlight
                        ? const Color(0xFF1B5E20)
                        : Colors.black87,
                    fontWeight: isHighlight
                        ? FontWeight.bold
                        : FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
