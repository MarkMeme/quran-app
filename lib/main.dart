import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:islami_app/qurab_details/sura_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyThemeData.dart';
import 'hadeth_details/each_hadeth_screen.dart';
import 'home/my_home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late AppConfigProvider provider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        SuraScreen.routeName: (context) => const SuraScreen(),
        HadethScreen.routeName: (context) => const HadethScreen()
      },
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appTheme,
    );
  }

  void initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String lng = prefs.getString('lng') ?? 'en';
    provider.changeLanguage(lng);
    String theme = prefs.getString('theme') ?? 'light';
    if (theme == 'light') {
      provider.changeTheme(ThemeMode.light);
    } else {
      provider.changeTheme(ThemeMode.dark);
    }
    int privCounter = prefs.getInt('counter') ?? 0;
    provider.changeCounter(privCounter);
  }
}
