
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          SizedBox(height: 24,),
          Text(AppLocalizations.of(context)!.radio,style: Theme.of(context).textTheme.headline1,),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.arrow_circle_left_outlined,size: 40,),
              Icon(Icons.play_circle,size: 50),
              Icon(Icons.arrow_circle_right_outlined,size: 40),
            ],
          )
        ]
      ),
    );
  }
}
