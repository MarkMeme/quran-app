import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/qurab_details/sura_screen.dart';

class LineDetails extends StatelessWidget {
  String name;

  LineDetails({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Text(
          name,
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
