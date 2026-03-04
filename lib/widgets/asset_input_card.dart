import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      color: isDeduction ? const Color(0xFFFFF8E1) : Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: isDeduction
                          ? Colors.orange[800]
                          : const Color(0xFF1B5E20),
                    ),
                  ),
                  Text(
                    hint,
                    style:
                        TextStyle(fontSize: 11, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 140,
              child: TextFormField(
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d*')),
                ],
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  prefixText: '$symbol ',
                  prefixStyle: TextStyle(
                    color: isDeduction
                        ? Colors.orange[700]
                        : const Color(0xFF1B5E20),
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: Color(0xFF1B5E20), width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                ),
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
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1B5E20),
        ),
      ),
    );
  }
}
