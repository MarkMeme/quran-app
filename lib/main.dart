import 'package:flutter/material.dart';
import 'package:islami_app/providers/AppConfigProvider.dart';
import 'package:islami_app/qurab_details/sura_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'MyThemeData.dart';
import 'hadeth_details/each_hadeth_screen.dart';
import 'home/my_home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AppConfigProvider(),
    child:const MyApp()
  )  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName : (context) => MyHomePage(),
        SuraScreen.routeName :(context) => const SuraScreen(),
        HadethScreen.routeName : (context) => const HadethScreen()
      },
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appTheme,
    );
  }
}
