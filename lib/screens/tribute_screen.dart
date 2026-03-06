import 'package:flutter/material.dart';
import 'zakat_calculator_screen.dart';

class TributeScreen extends StatefulWidget {
  const TributeScreen({super.key});

  @override
  State<TributeScreen> createState() => _TributeScreenState();
}

class _TributeScreenState extends State<TributeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => const ZakatCalculatorScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🌙',
                    style: TextStyle(fontSize: 80)),
                const SizedBox(height: 20),
                const Text(
                  'Mizan Zakat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Free · No Ads · No Data Collected',
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13),
                ),
                const SizedBox(height: 60),
                const CircularProgressIndicator(
                    color: Colors.white54, strokeWidth: 2),
                const SizedBox(height: 60),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'In loving memory of',
                        style: TextStyle(
                            color: Colors.white54, fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Mohammad Ibrahim (Nana)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '& Mohammad Aslam (Dada)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'رحمهم الله',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'May Allah grant them Jannatul Firdaus 🤲',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
