import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.onBackground),
                ),
                const Spacer(),
                provider.themeMode == ThemeMode.dark
                    ? const SizedBox.shrink()
                    : Icon(
                        Icons.done,
                        color: provider.themeMode == ThemeMode.light
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onBackground,
                        size: 35,
                      )
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.themeMode == ThemeMode.dark
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.onBackground),
                ),
                const Spacer(),
                provider.themeMode == ThemeMode.light
                    ? const SizedBox.shrink()
                    : Icon(
                        color: provider.themeMode == ThemeMode.light
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.background,
                        Icons.done,
                        size: 35,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
