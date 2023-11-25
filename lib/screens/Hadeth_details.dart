import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qurany/model/hadeth_model.dart';

class HadethDetailsScreen extends StatefulWidget {
  static String routeName = 'hadethDetails';

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;
    getHadethData(args.index);
    return Stack(children: [
      Image.asset(
        'assets/images/backgraound.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Card(
          margin: EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  getHadethData(int index) async {
    String file = await rootBundle.loadString('assets/files/h${index + 1}.txt');
    text = file;
    setState(() {});
  }
}
