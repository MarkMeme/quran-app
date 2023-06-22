import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_details/hadeth_tab.dart';

import 'each_hadeth_screen.dart';

class HadethTitleStyle extends StatelessWidget {
  String name;
  Hadeth hadeth;

  HadethTitleStyle({required this.hadeth, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(HadethScreen.routeName, arguments: hadeth);
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
