import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/AppConfigProvider.dart';

class TasbehTab extends StatefulWidget {

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  static int counter = 0;
  int innerCounter = 0;
  String eltext = 'سبحان الله';
  double turns = 0.0;

  void changeRotation() {
    setState(() => turns += 1.0 / 24);
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    eltextchange();
    return Container(
      //margin: EdgeInsets.all(18),
      padding: EdgeInsets.all(20),
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                provider.appTheme == ThemeMode.light
                    ? Image.asset('assets/images/head_sebha_logo.png')
                    : Image.asset('assets/images/head_sebha_dark.png'),
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 400),
                  child:
                  provider.appTheme == ThemeMode.light
                      ? Image.asset('assets/images/body_sebha_logo.png')
                      : Image.asset('assets/images/body_sebha_dark.png'),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.thenumberofpraises,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).textTheme.subtitle1!.color),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).textTheme.subtitle1!.color),
                child: InkWell(
                  onTap: () {
                    AudioPlayer().play(AssetSource('audio/button.mp3'));
                    tasbehCounter();
                    changeRotation();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                                Theme.of(context).textTheme.subtitle1!.color),
                        child: Text(
                          eltext,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                ))
          ]),
    );
  }

  void tasbehCounter() {
    counter++;
    setState(() {});
  }

  void eltextchange() {
    innerCounter++;
    if (innerCounter <= 99) {
      if (innerCounter <= 33) {
        eltext = 'سبحان الله';
      } else if (innerCounter <= 66 && innerCounter > 33) {
        eltext = 'الحمدلله';
      } else {
        eltext = 'لا اله الا الله';
      }
    } else {
      innerCounter -= 100;
      eltext = 'سبحان الله';
    }
  }
}
