import 'package:flutter/material.dart';
import 'zakat_calculator_screen.dart';

class TributeScreen extends StatefulWidget {
  const TributeScreen({super.key});

  @override
  State<TributeScreen> createState() => _TributeScreenState();
}

class _TributeScreenState extends State<TributeScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000));
    _slideController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1400));
    _pulseController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _fadeController, curve: Curves.easeIn));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
            .animate(CurvedAnimation(
                parent: _slideController,
                curve: Curves.easeOutCubic));
    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
        CurvedAnimation(
            parent: _pulseController, curve: Curves.easeInOut));
    Future.delayed(const Duration(milliseconds: 200), () {
      _fadeController.forward();
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _goToApp() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ZakatCalculatorScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A2A12),
              Color(0xFF0D3B1E),
              Color(0xFF1B5E20),
              Color(0xFF1A237E),
              Color(0xFF0D1B4B),
            ],
            stops: [0.0, 0.25, 0.55, 0.82, 1.0],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      ScaleTransition(
                        scale: _pulseAnimation,
                        child: const Text('☪️',
                            style: TextStyle(fontSize: 56)),
                      ),
                      const SizedBox(height: 10),
                      const Text('Mizan Zakat',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.5)),
                      const Text('ميزان زكاة',
                          style: TextStyle(
                              color: Color(0xFFFFD54F),
                              fontSize: 18,
                              letterSpacing: 4)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.amber.withOpacity(0.25)),
                        ),
                        child: const Text(
                          'Free Zakat Calculator for Everyone in the World',
                          style: TextStyle(
                              color: Color(0xFFFFD54F), fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                        style: TextStyle(
                            color: Colors.amber[200],
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.10),
                              Colors.white.withOpacity(0.05),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                              color: Colors.amber.withOpacity(0.35),
                              width: 1.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 26),
                          child: Column(
                            children: [
                              Text('In Loving Memory',
                                  style: TextStyle(
                                      color: Colors.amber[200],
                                      fontSize: 13,
                                      letterSpacing: 3,
                                      fontWeight: FontWeight.w300)),
                              const SizedBox(height: 4),
                              Text(
                                  'This App is Lovingly Dedicated To',
                                  style: TextStyle(
                                      color:
                                          Colors.white.withOpacity(0.55),
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic)),
                              const SizedBox(height: 26),
                              _PersonCard(
                                icon: '🌿',
                                relation: 'Nana Jaan',
                                relationSubtext:
                                    'Beloved Maternal Grandfather',
                                name: 'Mohammad Ibrahim',
                                urduName: 'محمد ابراہیم',
                                arabicDua: 'رَحِمَهُ اللّٰهُ',
                                duaTranslation:
                                    'May Allah have mercy on his soul',
                                iconBgColor:
                                    Colors.green.withOpacity(0.15),
                                iconBorderColor:
                                    Colors.green.withOpacity(0.3),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.transparent,
                                          Colors.amber.withOpacity(0.4)
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text('✦  وَ  ✦',
                                        style: TextStyle(
                                            color: Colors.amber[300],
                                            fontSize: 14,
                                            letterSpacing: 4)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.amber.withOpacity(0.4),
                                          Colors.transparent
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              _PersonCard(
                                icon: '🌙',
                                relation: 'Dada Jaan',
                                relationSubtext:
                                    'Beloved Paternal Grandfather',
                                name: 'Mohammad Aslam',
                                urduName: 'محمد اسلم',
                                arabicDua: 'رَحِمَهُ اللّٰهُ',
                                duaTranslation:
                                    'May Allah have mercy on his soul',
                                iconBgColor:
                                    Colors.indigo.withOpacity(0.2),
                                iconBorderColor:
                                    Colors.indigo.withOpacity(0.35),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.amber.withOpacity(0.20)),
                        ),
                        child: Column(
                          children: [
                            const Text('🤲',
                                style: TextStyle(fontSize: 28)),
                            const SizedBox(height: 10),
                            Text(
                              'رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِيْنَ',
                              style: TextStyle(
                                  color: Colors.amber[200],
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 2.0),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '"Our Lord, forgive me and my parents\nand the believers on the Day of Reckoning"',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.60),
                                  fontSize: 12.5,
                                  fontStyle: FontStyle.italic,
                                  height: 1.7),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text('— Surah Ibrahim · Ayah 41',
                                style: TextStyle(
                                    color:
                                        Colors.amber.withOpacity(0.45),
                                    fontSize: 11)),
                            const SizedBox(height: 16),
                            Container(
                                height: 1,
                                color: Colors.amber.withOpacity(0.15)),
                            const SizedBox(height: 16),
                            Text(
                              'May the blessings of Nana Mohammad Ibrahim\n'
                              '& Dada Mohammad Aslam forever guide us,\n'
                              'and may every Zakat paid through this app\n'
                              'be a Sadaqah Jariyah that reaches their souls. 🌹',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.55),
                                  fontSize: 12,
                                  height: 1.85),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: _goToApp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFB300),
                            foregroundColor: const Color(0xFF1A1A1A),
                            elevation: 10,
                            shadowColor:
                                Colors.amber.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(18)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calculate_outlined, size: 22),
                              SizedBox(width: 10),
                              Text(
                                'Get Started — Calculate Your Zakat',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _BadgePill(label: '🚫 No Ads'),
                          const SizedBox(width: 8),
                          _BadgePill(label: '🔒 No Data Collected'),
                          const SizedBox(width: 8),
                          _BadgePill(label: '💚 100% Free'),
                        ],
                      ),
                      const SizedBox(height: 26),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PersonCard extends StatelessWidget {
  final String icon, relation, relationSubtext, name, urduName,
      arabicDua, duaTranslation;
  final Color iconBgColor, iconBorderColor;

  const _PersonCard({
    required this.icon,
    required this.relation,
    required this.relationSubtext,
    required this.name,
    required this.urduName,
    required this.arabicDua,
    required this.duaTranslation,
    required this.iconBgColor,
    required this.iconBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
              border:
                  Border.all(color: iconBorderColor, width: 1.5)),
          child:
              Center(child: Text(icon, style: const TextStyle(fontSize: 30))),
        ),
        const SizedBox(height: 10),
        Text(relation,
            style: TextStyle(
                color: Colors.amber[300],
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        const SizedBox(height: 2),
        Text(relationSubtext,
            style: TextStyle(
                color: Colors.white.withOpacity(0.40), fontSize: 11)),
        const SizedBox(height: 10),
        Text(name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        const SizedBox(height: 4),
        Text(urduName,
            style: TextStyle(
                color: Colors.amber[200], fontSize: 18, height: 1.6),
            textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: Colors.green.withOpacity(0.25)),
          ),
          child: Text(arabicDua,
              style: TextStyle(
                  color: Colors.green[300],
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 5),
        Text(duaTranslation,
            style: TextStyle(
                color: Colors.white.withOpacity(0.38),
                fontSize: 11,
                fontStyle: FontStyle.italic)),
      ],
    );
  }
}

class _BadgePill extends StatelessWidget {
  final String label;
  const _BadgePill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Text(label,
          style: TextStyle(
              color: Colors.white.withOpacity(0.55), fontSize: 10)),
    );
  }
}
