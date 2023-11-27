import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

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
              provider.changeLanguage('en');
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.isArabic == true
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.onBackground),
                ),
                const Spacer(),
                provider.isArabic
                    ? Icon(
                        Icons.done,
                        color: provider.isArabic == true
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onBackground,
                        size: 35,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.isArabic == false
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.onBackground),
                ),
                const Spacer(),
                provider.isArabic
                    ? const SizedBox.shrink()
                    : Icon(
                        color: provider.isArabic == true
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
