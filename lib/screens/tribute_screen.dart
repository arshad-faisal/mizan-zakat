import 'package:flutter/material.dart';
import '../l10n/app_strings.dart';
import 'zakat_calculator_screen.dart';

class TributeScreen extends StatefulWidget {
  const TributeScreen({super.key});

  @override
  State<TributeScreen> createState() => _TributeScreenState();
}

class _TributeScreenState extends State<TributeScreen> {
  AppLanguage _selectedLanguage = AppLanguage.english;

  void _selectLanguage(AppLanguage lang) {
    setState(() => _selectedLanguage = lang);
  }

  void _continue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) =>
            ZakatCalculatorScreen(language: _selectedLanguage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(_selectedLanguage);

    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('🌙', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 12),
              Text(s.appTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1)),
              const SizedBox(height: 4),
              Text(s.appSubtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white54, fontSize: 12)),
              const SizedBox(height: 24),

              // Language Picker
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    const Text('🌐',
                        style: TextStyle(
                            color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _LangButton(
                          label: 'English',
                          selected: _selectedLanguage ==
                              AppLanguage.english,
                          onTap: () =>
                              _selectLanguage(AppLanguage.english),
                        ),
                        const SizedBox(width: 8),
                        _LangButton(
                          label: 'اردو',
                          selected:
                              _selectedLanguage == AppLanguage.urdu,
                          onTap: () =>
                              _selectLanguage(AppLanguage.urdu),
                        ),
                        const SizedBox(width: 8),
                        _LangButton(
                          label: 'हिंदी',
                          selected:
                              _selectedLanguage == AppLanguage.hindi,
                          onTap: () =>
                              _selectLanguage(AppLanguage.hindi),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tribute Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [
                    Text(s.inLovingMemory,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(s.tributeLine1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    Text(s.tributeLine2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),

                    // Arabic رحمهم الله — bigger
                    const Text(
                      'رحمهم الله',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 28,        // ← big & clear
                          height: 1.8),
                    ),
                    const SizedBox(height: 16),

                    // Dua 1
                    _DuaCard(
                      arabic:
                          'رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ',
                      transliteration:
                          'Rabbigh-fir lī wa li-wālidayya wa lil-mu\'minīn',
                      translation: s.dua1Translation,
                      source: 'Quran 71:28',
                    ),
                    const SizedBox(height: 12),

                    // Dua 2
                    _DuaCard(
                      arabic:
                          'رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
                      transliteration:
                          'Rabbir-ḥam-humā kamā rabbayānī ṣaghīrā',
                      translation: s.dua2Translation,
                      source: 'Quran 17:24',
                    ),
                    const SizedBox(height: 16),

                    Text(s.tributeFooter,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _continue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1B5E20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    elevation: 0,
                  ),
                  child: Text(s.continueBtn,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _LangButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: selected
                  ? const Color(0xFF1B5E20)
                  : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
}

class _DuaCard extends StatelessWidget {
  final String arabic;
  final String transliteration;
  final String translation;
  final String source;

  const _DuaCard({
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          // Arabic text — large & clear
          Text(arabic,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,          // ← large & readable
                  fontWeight: FontWeight.w600,
                  height: 2.2)),         // ← generous line spacing
          const SizedBox(height: 10),

          // Transliteration
          Text(transliteration,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  height: 1.5)),
          const SizedBox(height: 8),

          // Translation
          Text('"$translation"',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xCCFFFFFF),
                  fontSize: 14,          // ← clear & readable
                  height: 1.5)),
          const SizedBox(height: 6),

          // Source
          Text(source,
              style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 12)),
        ],
      ),
    );
  }
}
