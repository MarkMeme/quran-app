import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      height: 250,
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);

            },
            child: provider.appTheme==ThemeMode.dark?
                getSelectedWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedWidget(AppLocalizations.of(context)!.dark),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);

            },
            child: provider.appTheme==ThemeMode.light?
            getSelectedWidget(AppLocalizations.of(context)!.light)
                : getUnselectedWidget(AppLocalizations.of(context)!.light),
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
