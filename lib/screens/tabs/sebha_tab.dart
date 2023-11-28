import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qurany/providers/my_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  String text = '';

  @override
  Widget build(BuildContext context) {
    String text = _getText();

    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            const SizedBox(height: 30),
            Image.asset(provider.themeMode == ThemeMode.light
                ? 'assets/images/head_of_seb7a.png'
                : 'assets/images/dark_head_of_seb7a.png'),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * .088),
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(provider.themeMode == ThemeMode.light
                      ? 'assets/images/body_of_seb7a.png'
                      : 'assets/images/dark_body_of_seb7a.png'),
                ))
          ],
        ),
        Center(
          child: Text(
            AppLocalizations.of(context)!.tasbehNum,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: MediaQuery.of(context).size.height * .10,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text('$counter',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            _tasbeh();
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onError,
                ),
          ),
        )
      ],
    );
  }

  String _getText() {
    if (counter <= 33) {
      return AppLocalizations.of(context)!.sobhanAllah;
    } else if (counter <= 66) {
      return AppLocalizations.of(context)!.alhamudLlah;
    } else if (counter <= 99) {
      return AppLocalizations.of(context)!.allahAkbar;
    } else {
      counter = 0;
      return AppLocalizations.of(context)!.sobhanAllah;
    }
  }

  void _tasbeh() {
    setState(() {
      counter++;
      angle += 3;
      // Use the _getText method to update the text variable based on the counter.
      text = _getText();
    });
  }
}
