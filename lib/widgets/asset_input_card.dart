import 'package:flutter/material.dart';

class AssetInputCard extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String symbol;
  final bool isGrams;
  final bool isDeduction;

  const AssetInputCard({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.symbol,
    this.isGrams = false,
    this.isDeduction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      color: isDeduction ? Colors.red[50] : Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: isDeduction
                              ? Colors.red[700]
                              : Colors.black87)),
                  Text(hint,
                      style: TextStyle(
                          fontSize: 11, color: Colors.grey[500])),
                ],
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 120,
              child: Row(
                children: [
                  Text('$symbol ',
                      style: TextStyle(
                          color: isDeduction
                              ? Colors.red[700]
                              : const Color(0xFF1B5E20),
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType:
                          const TextInputType.numberWithOptions(
                              decimal: true),
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: '0.00',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(title,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20))),
    );
  }
}
