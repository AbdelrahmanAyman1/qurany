import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qurany/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'suraDetails';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      getFileData(args.index);
    }
    return Stack(
      children: [
        Image.asset(
          'assets/images/backgraound.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title:
                Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Card(
            margin: const EdgeInsets.all(18),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      verses[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ],
    );
  }

  getFileData(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> line = file.split('\n');
    verses = line;
    setState(() {});
  }
}
