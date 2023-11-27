import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qurany/model/hadeth_model.dart';
import 'package:qurany/screens/Hadeth_details.dart';
import 'package:qurany/widgets/divider.dart';
class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  List<String> hadethNum = [
    "حديث 1",
    "حديث 2",
    "حديث 3",
    "حديث 4",
    "حديث 5",
    "حديث 6",
    "حديث 7",
    "حديث 8",
    "حديث 9",
    "حديث 10",
    "حديث 11",
    "حديث 12",
    "حديث 13",
    "حديث 14",
    "حديث 15",
    "حديث 16",
    "حديث 17",
    "حديث 18",
    "حديث 19",
    "حديث 20",
    "حديث 21",
    "حديث 22",
    "حديث 23",
    "حديث 24",
    "حديث 25",
    "حديث 26",
    "حديث 27",
    "حديث 28",
    "حديث 29",
    "حديث 30",
    "حديث 31",
    "حديث 32",
    "حديث 33",
    "حديث 34",
    "حديث 35",
    "حديث 36",
    "حديث 37",
    "حديث 38",
    "حديث 39",
    "حديث 40",
    "حديث 41",
    "حديث 42",
    "حديث 43",
    "حديث 44",
    "حديث 45",
    "حديث 46",
    "حديث 47",
    "حديث 48",
    "حديث 49",
    "حديث 50"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/ahadeth_logo.png'),
        ),
        const SizedBox(
          height: 30,
        ),
        const CustomDivider(),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w100,
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        const CustomDivider(),
        Expanded(
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, HadethDetailsScreen.routeName,
                          arguments: HadethModel(hadethNum[index], index));
                    },
                    child: Text(
                      hadethNum[index],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                    endIndent: 40,
                    indent: 40,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              itemCount: hadethNum.length),
        )
      ],
    );
  }
}
