enum AppLanguage { english, urdu, hindi }

class AppStrings {
  final AppLanguage language;
  const AppStrings(this.language);

  // App General
  String get appTitle => _s('Mizan Zakat', 'میزان زکات', 'मीज़ान ज़कात');
  String get appSubtitle => _s(
      'Free · No Ads · No Data Collected',
      'مفت · کوئی اشتہار نہیں · کوئی ڈیٹا نہیں',
      'मुफ़्त · कोई विज्ञापन नहीं · कोई डेटा नहीं');
  String get continueBtn =>
      _s('Continue →', 'جاری رکھیں ←', 'जारी रखें →');
  String get loading => _s('Loading...', 'لوڈ ہو رہا ہے...', 'लोड हो रहा है...');

  // Tribute Screen
  String get inLovingMemory =>
      _s('🤲 In Loving Memory', '🤲 محبت بھری یاد میں', '🤲 प्रेमपूर्ण स्मृति में');
  String get tributeLine1 =>
      _s('Mohammad Ibrahim (Nana)', 'محمد ابراہیم (نانا)', 'मोहम्मद इब्राहिम (नाना)');
  String get tributeLine2 =>
      _s('& Mohammad Aslam (Dada)', 'اور محمد اسلم (دادا)', 'और मोहम्मद असलम (दादा)');
  String get tributeFooter => _s(
      'May Allah grant them Jannatul Firdaus\nand accept this Sadaqah Jariyah 🤲',
      'اللہ انہیں جنت الفردوس عطا فرمائے\nاور یہ صدقہ جاریہ قبول فرمائے 🤲',
      'अल्लाह उन्हें जन्नतुल फिरदौस अता करे\nऔर यह सदका-ए-जारिया कबूल करे 🤲');
  String get dua1Translation => _s(
      'My Lord! Forgive me, my parents, and the believers.',
      'اے میرے رب! مجھے، میرے والدین اور مومنوں کو معاف فرما۔',
      'हे मेरे रब! मुझे, मेरे माता-पिता और मोमिनों को माफ़ कर दे।');
  String get dua2Translation => _s(
      'My Lord! Be merciful to them as they raised me when I was young.',
      'اے میرے رب! ان پر رحم فرما جیسے انہوں نے مجھے بچپن میں پالا۔',
      'हे मेरे रब! उन पर रहम कर जैसे उन्होंने मुझे बचपन में पाला।');

  // About Screen
  String get aboutTitle => _s('About Mizan Zakat', 'میزان زکات کے بارے میں', 'मीज़ान ज़कात के बारे में');
  String get aboutApp => _s('About This App', 'اس ایپ کے بارے میں', 'इस ऐप के बारे में');
  String get aboutDesc => _s(
      'A free, private Zakat calculator built for the Ummah. No ads, no tracking, no data collected. Ever.',
      'امت کے لیے بنایا گیا ایک مفت، نجی زکات کیلکولیٹر۔ کوئی اشتہار نہیں، کوئی ٹریکنگ نہیں، کوئی ڈیٹا اکٹھا نہیں۔',
      'उम्मत के लिए बनाया गया एक मुफ़्त, निजी ज़कात कैलकुलेटर। कोई विज्ञापन नहीं, कोई ट्रैकिंग नहीं, कोई डेटा नहीं।');
  String get dedicatedTo =>
      _s('🤲 Dedicated To', '🤲 یہ وقف ہے', '🤲 समर्पित');
  String get developer =>
      _s('👨‍💻 Developer', '👨‍💻 ڈویلپر', '👨‍💻 डेवलपर');
  String get feedback =>
      _s('📩 Feedback', '📩 رائے', '📩 फ़ीडबैक');
  String get feedbackDesc => _s(
      'Have a suggestion or found an issue?',
      'کوئی تجویز یا مسئلہ ملا؟',
      'कोई सुझाव या समस्या मिली?');
  String get sendEmail =>
      _s('Send Email', 'ای میل بھیجیں', 'ईमेल भेजें');
  String get version => _s('Version 1.0', 'ورژن 1.0', 'संस्करण 1.0');
  String get builtWith =>
      _s('Built with ❤️ for the Ummah', 'امت کے لیے ❤️ کے ساتھ بنایا گیا', 'उम्मत के लिए ❤️ के साथ बनाया गया');

  // Currency Banner
  String currencyBanner(String name, String code) => _s(
      'Currency: $name ($code) — change via 🌐 menu',
      'کرنسی: $name ($code) — 🌐 مینو سے تبدیل کریں',
      'मुद्रा: $name ($code) — 🌐 मेनू से बदलें');

  // Metal Prices
  String get metalPricesTitle =>
      _s('📈 Today\'s Metal Prices', '📈 آج کی دھات کی قیمتیں', '📈 आज की धातु की कीमतें');
  String get metalPricesHint => _s(
      'Search Google: "gold price per gram today"',
      'گوگل پر تلاش کریں: "آج سونے کی قیمت فی گرام"',
      'गूगल पर खोजें: "आज सोने का भाव प्रति ग्राम"');
  String get goldPerGram =>
      _s('🥇 Gold / gram', '🥇 سونا / گرام', '🥇 सोना / ग्राम');
  String get silverPerGram =>
      _s('🥈 Silver / gram', '🥈 چاندی / گرام', '🥈 चाँदी / ग्राम');
  String get metalPriceError => _s(
      'Please enter today\'s gold & silver price per gram to continue',
      'براہ کرم آج کی سونے اور چاندی کی قیمت فی گرام درج کریں',
      'कृपया आज का सोने और चाँदी का भाव प्रति ग्राम दर्ज करें');

  // Section Headers
  String get sectionCash =>
      _s('💵 Cash & Bank Savings', '💵 نقد اور بینک بچت', '💵 नकद और बैंक बचत');
  String get sectionGold =>
      _s('🥇 Gold & Silver', '🥇 سونا اور چاندی', '🥇 सोना और चाँदी');
  String get sectionBusiness =>
      _s('🏢 Business & Investments', '🏢 کاروبار اور سرمایہ کاری', '🏢 व्यापार और निवेश');
  String get sectionProperty =>
      _s('🏠 Property & Real Estate', '🏠 جائیداد اور رئیل اسٹیٹ', '🏠 संपत्ति और रियल एस्टेट');
  String get sectionDebts =>
      _s('📉 Debts & Liabilities', '📉 قرض اور واجبات', '📉 कर्ज और देनदारियाँ');

  // Asset Fields
  String get cashAtHome => _s('Cash at Home', 'گھر میں نقد', 'घर में नकद');
  String get cashAtHomeHint =>
      _s('Physical cash you have', 'آپ کے پاس موجود نقد رقم', 'आपके पास मौजूद नकद राशि');
  String get bankAccounts =>
      _s('Bank Accounts', 'بینک اکاؤنٹس', 'बैंक खाते');
  String get bankAccountsHint => _s(
      'All savings & current accounts',
      'تمام بچت اور کرنٹ اکاؤنٹس',
      'सभी बचत और चालू खाते');
  String get goldOwned => _s('Gold Owned', 'سونے کی ملکیت', 'सोने का स्वामित्व');
  String get goldOwnedHint => _s(
      'Total grams (jewellery + bars)',
      'کل گرام (زیورات + بار)',
      'कुल ग्राम (गहने + बार)');
  String get silverOwned =>
      _s('Silver Owned', 'چاندی کی ملکیت', 'चाँदी का स्वामित्व');
  String get silverOwnedHint =>
      _s('Total grams', 'کل گرام', 'कुल ग्राम');
  String get businessInventory =>
      _s('Business Inventory', 'کاروباری انوینٹری', 'व्यापार की सूची');
  String get businessInventoryHint => _s(
      'Current value of goods for trade',
      'تجارتی سامان کی موجودہ قیمت',
      'व्यापार के सामान का वर्तमान मूल्य');
  String get stocksInvestments =>
      _s('Stocks & Investments', 'اسٹاک اور سرمایہ کاری', 'स्टॉक और निवेश');
  String get stocksInvestmentsHint =>
      _s('Current market value', 'موجودہ مارکیٹ قیمت', 'वर्तमान बाज़ार मूल्य');
  String get moneyOwed =>
      _s('Money Owed to You', 'آپ کا واجب الادا پیسہ', 'आपका बकाया पैसा');
  String get moneyOwedHint => _s(
      'Recoverable loans given out',
      'قابل وصول قرضے',
      'वसूली योग्य दिए गए कर्ज');
  String get propertyResale =>
      _s('Property for Resale', 'دوبارہ فروخت کے لیے جائیداد', 'पुनर्विक्रय के लिए संपत्ति');
  String get propertyResaleHint => _s(
      'Land/property bought to sell — market value',
      'فروخت کے لیے خریدی گئی زمین — مارکیٹ قیمت',
      'बेचने के लिए खरीदी ज़मीन — बाज़ार मूल्य');
  String get rentalIncome =>
      _s('Net Rental Income', 'خالص کرایہ آمدنی', 'शुद्ध किराया आय');
  String get rentalIncomeHint => _s(
      'Annual rent received minus expenses',
      'سالانہ کرایہ وصول شدہ منفی اخراجات',
      'प्राप्त वार्षिक किराया घटा खर्च');
  String get investmentLand =>
      _s('Investment Land (Unused)', 'سرمایہ کاری کی زمین (غیر استعمال)', 'निवेश भूमि (अप्रयुक्त)');
  String get investmentLandHint => _s(
      'Land held for future profit — market value',
      'مستقبل کے منافع کے لیے زمین — مارکیٹ قیمت',
      'भविष्य के लाभ के लिए भूमि — बाज़ार मूल्य');
  String get propertyStock =>
      _s('Property Business Stock', 'جائیداد کاروبار کا ذخیرہ', 'संपत्ति व्यापार स्टॉक');
  String get propertyStockHint => _s(
      'If you are a property trader — inventory value',
      'اگر آپ جائیداد کے تاجر ہیں — انوینٹری قیمت',
      'यदि आप संपत्ति व्यापारी हैं — सूची मूल्य');
  String get outstandingDebts =>
      _s('Outstanding Debts', 'واجب الادا قرضے', 'बकाया कर्ज');
  String get outstandingDebtsHint =>
      _s('Loans, bills due now', 'ابھی واجب الادا قرضے اور بل', 'अभी देय कर्ज और बिल');
  String get propertyExemptNote => _s(
      'Primary home, personal cars & belongings are EXEMPT. Only zakatable property below.',
      'بنیادی گھر، ذاتی گاڑیاں اور سامان مستثنیٰ ہیں۔ صرف قابل زکات جائیداد نیچے ہے۔',
      'प्राथमिक घर, निजी कारें और सामान EXEMPT हैं। केवल ज़कात योग्य संपत्ति नीचे है।');

  // Calculate Button
  String get calculateBtn =>
      _s('Calculate My Zakat', 'میری زکات حساب کریں', 'मेरी ज़कात कैलकुलेट करें');
  String get resetBtn => _s('Reset', 'ری سیٹ', 'रीसेट');

  // Explanation Card
  String get whatIsZakat =>
      _s('📖 What is Zakat?', '📖 زکات کیا ہے؟', '📖 ज़कात क्या है?');
  String get zakatDesc => _s(
      'Zakat is the 3rd Pillar of Islam — an annual 2.5% charity on wealth held for one full lunar year (Hawl), if it exceeds the Nisab threshold.',
      'زکات اسلام کا تیسرا رکن ہے — ایک مکمل قمری سال (حول) تک رکھی گئی دولت پر 2.5 فیصد سالانہ صدقہ، اگر یہ نصاب سے زیادہ ہو۔',
      'ज़कात इस्लाम का तीसरा स्तंभ है — एक पूर्ण चंद्र वर्ष (हौल) तक रखी गई संपत्ति पर 2.5% वार्षिक दान, यदि यह निसाब से अधिक हो।');
  String get zakatRate =>
      _s('⚖️ Zakat Rate', '⚖️ زکات کی شرح', '⚖️ ज़कात दर');
  String get zakatRateValue =>
      _s('2.5% of Net Wealth', 'خالص دولت کا 2.5٪', 'शुद्ध संपत्ति का 2.5%');
  String get goldNisabLabel =>
      _s('🥇 Gold Nisab', '🥇 سونے کا نصاب', '🥇 सोने का निसाब');
  String get silverNisabLabel =>
      _s('🥈 Silver Nisab', '🥈 چاندی کا نصاب', '🥈 चाँदी का निसाब');
  String get goldNisabGrams =>
      _s('87.48 grams of gold', 'سونے کے 87.48 گرام', 'सोने के 87.48 ग्राम');
  String get silverNisabGrams =>
      _s('612.36 grams of silver', 'چاندی کے 612.36 گرام', 'चाँदी के 612.36 ग्राम');
  String get goldNisabValue =>
      _s('💰 Gold Nisab Value', '💰 سونے کے نصاب کی قیمت', '💰 सोने के निसाब का मूल्य');
  String get silverNisabValue =>
      _s('💰 Silver Nisab Value', '💰 چاندی کے نصاب کی قیمت', '💰 चाँदी के निसाब का मूल्य');
  String get nisabNote => _s(
      '* Silver Nisab used (recommended — more inclusive per Hanafi school)',
      '* چاندی کا نصاب استعمال کیا گیا (تجویز کردہ — حنفی مذہب کے مطابق زیادہ جامع)',
      '* चाँदी का निसाब उपयोग किया गया (अनुशंसित — हनफ़ी मज़हब के अनुसार अधिक समावेशी)');
  String get enterPricesHint => _s(
      'Enter gold & silver prices above to see current Nisab values.',
      'موجودہ نصاب کی قیمتیں دیکھنے کے لیے اوپر سونے اور چاندی کی قیمتیں درج کریں۔',
      'वर्तमान निसाब मूल्य देखने के लिए ऊपर सोने और चाँदी की कीमतें दर्ज करें।');

  // Result Card
  String get zakatDue =>
      _s('🌙 Zakat is Due', '🌙 زکات واجب ہے', '🌙 ज़कात देय है');
  String get noZakatDue => _s(
      '✅ No Zakat Due This Year',
      '✅ اس سال زکات واجب نہیں',
      '✅ इस साल ज़कात देय नहीं');
  String zakatWealth(String s, String amount) => _s(
      'Total Zakatable Wealth: $s $amount',
      'کل قابل زکات دولت: $s $amount',
      'कुल ज़कात योग्य संपत्ति: $s $amount');
  String belowNisab(String wealth, String nisab) => _s(
      'Your wealth ($wealth) is below Nisab ($nisab)',
      'آپ کی دولت ($wealth) نصاب ($nisab) سے کم ہے',
      'आपकी संपत्ति ($wealth) निसाब ($nisab) से कम है');
  String get shareBtn =>
      _s('Share My Calculation', 'میرا حساب شیئر کریں', 'मेरी गणना शेयर करें');
  String get nisabThresholds =>
      _s('📊 Nisab Thresholds', '📊 نصاب کی حدیں', '📊 निसाब की सीमाएँ');
  String get goldNisabRow =>
      _s('🥇 Gold Nisab (87.48g)', '🥇 سونے کا نصاب (87.48g)', '🥇 सोने का निसाब (87.48g)');
  String get silverNisabRow => _s(
      '🥈 Silver Nisab (612.36g)',
      '🥈 چاندی کا نصاب (612.36g)',
      '🥈 चाँदी का निसाब (612.36g)');
  String get nisabUsedRow =>
      _s('Nisab Used (Silver — Hanafi)', 'نصاب استعمال شدہ (چاندی — حنفی)', 'उपयोग किया निसाब (चाँदी — हनफ़ी)');
  String get wealthBreakdown =>
      _s('🧾 Wealth Breakdown', '🧾 دولت کی تفصیل', '🧾 संपत्ति विवरण');
  String get netZakatableWealth =>
      _s('Net Zakatable Wealth', 'خالص قابل زکات دولت', 'शुद्ध ज़कात योग्य संपत्ति');
  String get zakatDue25 =>
      _s('Zakat Due (2.5%)', 'زکات واجب (2.5٪)', 'ज़कात देय (2.5%)');
  String get notDue => _s('Not Due', 'واجب نہیں', 'देय नहीं');
  String get outstandingDebtsRow =>
      _s('📉 Outstanding Debts', '📉 واجب الادا قرضے', '📉 बकाया कर्ज');

  // Share text
  String shareText(String s, String assets, String debts, String wealth,
      String nisab, String zakat, bool meetsNisab) {
    if (language == AppLanguage.urdu) {
      return '''
🌙 میزان زکات — میرا حساب
━━━━━━━━━━━━━━━━━━
کل اثاثے:      $s $assets
واجبات:        − $s $debts
خالص دولت:    $s $wealth
نصاب (چاندی): $s $nisab
━━━━━━━━━━━━━━━━━━
${meetsNisab ? '✅ زکات واجب: $s $zakat (2.5٪)' : '⚠️ اس سال زکات واجب نہیں'}
━━━━━━━━━━━━━━━━━━
میزان زکات ایپ سے حساب کیا گیا 🤲
محمد ابراہیم (نانا) اور محمد اسلم (دادا) کی یاد میں رحمهم الله''';
    } else if (language == AppLanguage.hindi) {
      return '''
🌙 मीज़ान ज़कात — मेरी गणना
━━━━━━━━━━━━━━━━━━
कुल संपत्ति:    $s $assets
देनदारियाँ:     − $s $debts
शुद्ध संपत्ति:  $s $wealth
निसाब (चाँदी): $s $nisab
━━━━━━━━━━━━━━━━━━
${meetsNisab ? '✅ ज़कात देय: $s $zakat (2.5%)' : '⚠️ इस साल ज़कात देय नहीं'}
━━━━━━━━━━━━━━━━━━
मीज़ान ज़कात ऐप से गणना की गई 🤲
मोहम्मद इब्राहिम (नाना) और मोहम्मद असलम (दादा) की याद में رحمهم الله''';
    }
    return '''
🌙 Mizan Zakat — My Calculation
━━━━━━━━━━━━━━━━━━
Total Assets:    $s $assets
Liabilities:     − $s $debts
Net Wealth:      $s $wealth
Nisab (Silver):  $s $nisab
━━━━━━━━━━━━━━━━━━
${meetsNisab ? '✅ Zakat Due: $s $zakat (2.5%)' : '⚠️ Zakat Not Due This Year'}
━━━━━━━━━━━━━━━━━━
Calculated with Mizan Zakat App 🤲
In memory of Mohammad Ibrahim (Nana) & Mohammad Aslam (Dada) رحمهم الله''';
  }

  // Bottom footer
  String get mayAllahAccept => _s(
      '🤲 May Allah accept your Zakat',
      '🤲 اللہ آپ کی زکات قبول فرمائے',
      '🤲 अल्लाह आपकी ज़कात कबूल करे');
  String get footerMemory => _s(
      'In memory of Mohammad Ibrahim (Nana) & Mohammad Aslam (Dada) رحمهم الله',
      'محمد ابراہیم (نانا) اور محمد اسلم (دادا) کی یاد میں رحمهم الله',
      'मोहम्मद इब्राहिम (नाना) और मोहम्मद असलम (दादा) की याद में رحمهم الله');

  String _s(String en, String ur, String hi) {
    switch (language) {
      case AppLanguage.urdu:
        return ur;
      case AppLanguage.hindi:
        return hi;
      default:
        return en;
    }
  }
}
