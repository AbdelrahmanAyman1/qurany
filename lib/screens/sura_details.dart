import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurany/model/sura_model.dart';
import 'package:qurany/providers/my_provider.dart';
import 'package:qurany/providers/sura_detalis_provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'suraDetails';

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    var povider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider(),
        builder: (context, child) {
          var suraPovider = Provider.of<SuraDetailsProvider>(context)
            ..getFileData(args.index);
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
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            suraPovider.verses[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    itemCount: suraPovider.verses.length,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
