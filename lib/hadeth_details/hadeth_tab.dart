import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../MyThemeData.dart';
import 'hafeth_title_style.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({Key? key}) : super(key: key);

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  static List<Hadeth> allAhadethList = [];

  @override
  void initState() {
    super.initState();
    if(allAhadethList.isEmpty){
      loadAhadeth();
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*loadAhadeth();
    if(allAhadethList.isEmpty){
      loadAhadeth();
    }

     */
    return Column(children: [
      Container(
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage('assets/images/hadeth_logo.png'),
        ),
      ),
      Divider(
        thickness: 2,
        color: Theme.of(context).textTheme.subtitle1!.color,
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Text(
          AppLocalizations.of(context)!.hadethName,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      Divider(
        thickness: 2,
        color: Theme.of(context).textTheme.subtitle1!.color,
      ),
      allAhadethList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : Expanded(
              child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: Theme.of(context).textTheme.subtitle1!.color,
                );
              },
              itemBuilder: (context, index) {
                return HadethTitleStyle( name: allAhadethList[index].title,hadeth: allAhadethList[index],);
              },
              itemCount: allAhadethList.length,
            )),
    ]);
  }

  void loadAhadeth() async {
    setState(() {});
    String allAhadeth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethContetntAndTitle = allAhadeth.split('#\r\n');
    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> eachHadeth = ahadethContetntAndTitle[i].split('\n');
      String title = eachHadeth[0];
      eachHadeth.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: eachHadeth);
      allAhadethList.add(hadeth);
    }
    allAhadethList.isNotEmpty == true ;
    setState(() {});
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
