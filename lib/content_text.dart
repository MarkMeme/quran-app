import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {
  String name;

  ContentText({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.subtitle1,
      textAlign: TextAlign.center,
    );
  }
}
