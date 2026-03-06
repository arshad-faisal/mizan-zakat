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
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ZakatCalculatorScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text('🌙', style: TextStyle(fontSize: 72)),
              const SizedBox(height: 16),
              const Text('Mizan Zakat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2)),
              const SizedBox(height: 6),
              const Text('Free · No Ads · No Data Collected',
                  style: TextStyle(color: Colors.white54, fontSize: 12)),
              const SizedBox(height: 32),

              // Tribute box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  children: [
                    Text('🤲 In Loving Memory',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text('Mohammad Ibrahim (Nana)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    Text('& Mohammad Aslam (Dada)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text('رحمهم الله',
                        style: TextStyle(color: Colors.white70, fontSize: 18)),
                    SizedBox(height: 14),

                    // Dua 1
                    _DuaCard(
                      arabic: 'رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ',
                      transliteration:
                          'Rabbigh-fir lī wa li-wālidayya wa lil-mu\'minīn',
                      translation:
                          'My Lord! Forgive me, my parents, and the believers.',
                      source: 'Quran 71:28',
                    ),
                    SizedBox(height: 10),

                    // Dua 2
                    _DuaCard(
                      arabic:
                          'رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
                      transliteration:
                          'Rabbir-ḥam-humā kamā rabbayānī ṣaghīrā',
                      translation:
                          'My Lord! Be merciful to them as they raised me when I was young.',
                      source: 'Quran 17:24',
                    ),
                    SizedBox(height: 14),

                    Text(
                      'May Allah grant them Jannatul Firdaus\nand accept this Sadaqah Jariyah 🤲',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const CircularProgressIndicator(
                  color: Colors.white38, strokeWidth: 2),
              const SizedBox(height: 12),
              const Text('Loading...',
                  style: TextStyle(color: Colors.white38, fontSize: 12)),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
