
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';

class RadioTab extends StatefulWidget {


  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final FlutterRadioPlayer _flutterRadioPlayer = FlutterRadioPlayer();

  final FRPSource frpSource = FRPSource(
    mediaSources: <MediaSources>[
      MediaSources(
          url: "http://pavo.prostreaming.net:8052/stream",
          description: "Stream with ICY",
          isPrimary: true,
          title: "Z Fun hundred",
          isAac: true
      ),
      MediaSources(
          url: "http://209.133.216.3:7018/;stream.mp3",
          description: "Hiru FM Sri Lanka",
          isPrimary: false,
          title: "HiruFM",
          isAac: false
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _flutterRadioPlayer.initPlayer();
    _flutterRadioPlayer.addMediaSources(frpSource);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          const SizedBox(height: 24,),
          Text(AppLocalizations.of(context)!.radio,style: Theme.of(context).textTheme.headline1,),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: (){},
                  child: const Icon(Icons.arrow_circle_left_outlined,size: 40,)),
              InkWell(
                  onTap: (){
                    _flutterRadioPlayer.play();
                  },
                  child: const Icon(Icons.play_circle,size: 50)),
              InkWell(
                  onTap: (){
                    _flutterRadioPlayer.pause();
                  },
                  child: const Icon(Icons.arrow_circle_right_outlined,size: 40)),
            ],
          )
        ]
      ),
    );
  }
}
