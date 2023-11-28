import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qurany/providers/my_provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(provider.themeMode == ThemeMode.light
                    ? 'assets/images/body_of_seb7a.png'
                    : 'assets/images/dark_body_of_seb7a.png'))
          ],
        ),
        Center(
          child: Text(
            'عدد التسبيحات',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .10,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text('0',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          child: Text(
            'سبحان الله',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onError,
                ),
          ),
        )
      ],
    );
  }
}
