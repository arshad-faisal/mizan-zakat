import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_strings.dart';

class AboutScreen extends StatelessWidget {
  final AppLanguage language;
  const AboutScreen({super.key, required this.language});

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'arshadfaisal786@gmail.com',
      queryParameters: {
        'subject': 'Mizan Zakat Feedback',
        'body': 'Assalamualaikum,\n\nFeedback / Suggestion:\n',
      },
    );
    try {
      await launchUrl(emailUri);
    } catch (e) {
      debugPrint('Could not launch email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = AppStrings(language);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: Text(s.aboutTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // App info
            _AboutCard(
              child: Column(
                children: [
                  const Text('🌙', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(s.appTitle,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20))),
                  const SizedBox(height: 4),
                  Text(s.version,
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: 12)),
                  const SizedBox(height: 12),
                  Text(s.aboutDesc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey[700])),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Dedicated to
            _AboutCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(s.dedicatedTo,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20))),
                  const SizedBox(height: 10),
                  Text(s.tributeLine1,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Text(s.tributeLine2,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  const Text('رحمهم الله',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF1B5E20))),
                  const SizedBox(height: 10),
                  _DuaRow(
                    arabic:
                        'رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ',
                    translation: s.dua1Translation,
                    source: 'Quran 71:28',
                  ),
                  const SizedBox(height: 8),
                  _DuaRow(
                    arabic:
                        'رَّبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا',
                    translation: s.dua2Translation,
                    source: 'Quran 17:24',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Developer
            _AboutCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.developer,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20))),
                  const SizedBox(height: 8),
                  const Text('Arshad Faisal',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Feedback
            _AboutCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.feedback,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20))),
                  const SizedBox(height: 6),
                  Text(s.feedbackDesc,
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey[600])),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _sendEmail,
                      icon: const Icon(Icons.email_outlined,
                          color: Color(0xFF1B5E20)),
                      label: Text(s.sendEmail,
                          style: const TextStyle(
                              color: Color(0xFF1B5E20))),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xFF1B5E20)),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text(s.builtWith,
                style:
                    TextStyle(color: Colors.grey[500], fontSize: 12)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final Widget child;
  const _AboutCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(width: double.infinity, child: child),
      ),
    );
  }
}

class _DuaRow extends StatelessWidget {
  final String arabic, translation, source;
  const _DuaRow(
      {required this.arabic,
      required this.translation,
      required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: Column(
        children: [
          Text(arabic,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 2.0)),
          const SizedBox(height: 6),
          Text('"$translation"',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12, color: Colors.grey[700])),
          const SizedBox(height: 4),
          Text(source,
              style: TextStyle(
                  fontSize: 11, color: Colors.grey[500])),
        ],
      ),
    );
  }
}
