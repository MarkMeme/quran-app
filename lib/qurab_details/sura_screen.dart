import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../MyThemeData.dart';
import '../content_text.dart';
import '../providers/AppConfigProvider.dart';
import 'line_details.dart';

class SuraScreen extends StatefulWidget {
  const SuraScreen({Key? key}) : super(key: key);
  static const String routeName = 'SuraScreen';

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}


class _SuraScreenState extends State<SuraScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraArgs;
    var provider = Provider.of<AppConfigProvider>(context);

    if (verses.isEmpty) {
      loadSuraLines(args.index);
    }
    return Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        child: provider.appTheme == ThemeMode.dark
            ? const Image(image: AssetImage('assets/images/dark_bg.png'),fit: BoxFit.cover,)
            : const Image(image: AssetImage('assets/images/default_bg.png'),fit: BoxFit.cover,),),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyThemeData.whiteColor),
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ContentText(
                      name: verses[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      color: MyThemeData.primaryColor,
                    );
                  },
                  itemCount: verses.length),
        ),
      )
    ]);
  }

  void loadSuraLines(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
    print(lines);
  }
}

class SuraArgs {
  String name;
  int index;

  SuraArgs({required this.name, required this.index});
}
