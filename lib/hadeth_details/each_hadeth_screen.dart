import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../MyThemeData.dart';
import '../content_text.dart';
import '../providers/AppConfigProvider.dart';
import 'hadeth_tab.dart';



class HadethScreen extends StatefulWidget {
  const HadethScreen({Key? key}) : super(key: key);
  static const String routeName = 'HadethScreen';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}


class _HadethScreenState extends State<HadethScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
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
            args.title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyThemeData.whiteColor),
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: args.content.isEmpty
              ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          )
              : ListView.separated(
              itemBuilder: (context, index) {
                return ContentText(
                  name: args.content[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: MyThemeData.primaryColor,
                );
              },
              itemCount: args.content.length),
        ),
      )
    ]);
  }


}