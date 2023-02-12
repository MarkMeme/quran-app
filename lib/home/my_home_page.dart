import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth_details/hadeth_tab.dart';
import 'package:islami_app/radio_details/radio_tab.dart';
import 'package:islami_app/tasbeh_details/tasbeh_tab.dart';
import 'package:islami_app/qurab_details/quran_tab.dart';
import 'package:provider/provider.dart';

import '../providers/AppConfigProvider.dart';
import '../settings_details/settings_tab.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = 'homePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: provider.appTheme == ThemeMode.dark
            ? const Image(image: AssetImage('assets/images/dark_bg.png'),fit: BoxFit.cover,)
            : const Image(image: AssetImage('assets/images/default_bg.png'),fit: BoxFit.cover,),),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: tabs[selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/icon_quran.png'),
                    ),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png'),
                    ),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/icon_sebha.png'),
                    ),
                    label: AppLocalizations.of(context)!.tasbeh),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/icon_radio.png'),
                    ),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
              currentIndex: selectedIndex,
              onTap: (i) {
                selectedIndex = i;
                setState(() {});
              },
            ),
          ),
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    SettingsTab()
  ];
}
