import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MyThemeData.dart';
import '../providers/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
              Navigator.pop(context);

            },
            child: provider.appLanguage=='en'?
                getSelectedWidget(AppLocalizations.of(context)!.english)
                : getUnselectedWidget(AppLocalizations.of(context)!.english),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: provider.appLanguage=='ar'?
            getSelectedWidget(AppLocalizations.of(context)!.arabic)
                : getUnselectedWidget(AppLocalizations.of(context)!.arabic),
          )
        ],
      ),
    );
  }
  Widget getSelectedWidget (String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 23,
              fontWeight: FontWeight.bold
          )
          ,),
        Icon(
          Icons.check_box,size: 25,color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
  Widget getUnselectedWidget (String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: TextStyle(
              color: Theme.of(context).textTheme.headline3!.color,
              fontSize: 23,
              fontWeight: FontWeight.bold
          )
          ,),

      ],
    );
  }
}
