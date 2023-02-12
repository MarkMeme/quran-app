
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:radio_player/radio_player.dart';


class RadioTab extends StatefulWidget {


  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = false;
  List<String>? metadata;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }
  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Radio Player',
      url: 'https://radio.garden/listen/quran-fm-98-2-idhaet-alqran-alkrym/GQxvGBNK',
      imagePath: 'assets/cover.jpg',
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_image.png'),
        const SizedBox(height: 24,),
        Text(AppLocalizations.of(context)!.radio,style: Theme.of(context).textTheme.headline1,),
        const SizedBox(height: 24,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: (){
                  _radioPlayer.play();                  },
                child: const Icon(Icons.play_circle,size: 50)),
            InkWell(
                onTap: (){
                  _radioPlayer.pause();
                },
                child: const Icon(Icons.pause,size: 40)),
          ],
        )
      ]
    );
  }
}
