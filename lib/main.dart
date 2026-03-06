import 'package:flutter/material.dart';
import 'screens/zakat_calculator_screen.dart';
import 'screens/tribute_screen.dart';

void main() {
  runApp(const MizanZakatApp());
}

class MizanZakatApp extends StatelessWidget {
  const MizanZakatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mizan Zakat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1B5E20)),
        useMaterial3: true,
      ),
      home: const TributeScreen(),
    );
  }
}
