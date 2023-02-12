import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/qurab_details/sura_screen.dart';

class SuraNameStyle extends StatelessWidget {
String name;
int index ;
SuraNameStyle({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell( onTap: () {
        Navigator.of(context).pushNamed(SuraScreen.routeName,
        arguments: SuraArgs(name: name, index: index)) ;
      },

        child: Text(
          name,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
