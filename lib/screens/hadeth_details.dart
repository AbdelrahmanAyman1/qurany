import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurany/model/hadeth_model.dart';
import 'package:qurany/providers/ahadeth_detalis_provider.dart';

import '../providers/my_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static String routeName = 'hadethDetails';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;
    var povider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
        create: (context) => AhadethDetailsProvider(),
        builder: (context, child) {
          var ahadethProvider = Provider.of<AhadethDetailsProvider>(context)
            ..getHadethData(args.index);

          return Stack(
            children: [
              Image.asset(
                povider.themeMode == ThemeMode.light
                    ? 'assets/images/backgraound.png'
                    : 'assets/images/backgraound_dark.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Scaffold(
                appBar: AppBar(
                  title: Text(args.name,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                body: Card(
                  margin: const EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  child: Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          ahadethProvider.text,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
