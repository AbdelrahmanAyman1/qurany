import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qurany/providers/my_provider.dart';
import 'package:qurany/screens/tabs/ahadeth_tab.dart';
import 'package:qurany/screens/tabs/quran_tab.dart';
import 'package:qurany/screens/tabs/radio_tab.dart';
import 'package:qurany/screens/tabs/sebha_tab.dart';
import 'package:qurany/screens/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(children: [
      Image.asset(
        provider.themeMode == ThemeMode.light
            ? 'assets/images/backgraound.png'
            : 'assets/images/backgraound_dark.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/moshaf.png')),
                label: AppLocalizations.of(context)!.quran,
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                ),
                label: AppLocalizations.of(context)!.ahadeth,
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/sebha.png'),
                ),
                label: AppLocalizations.of(context)!.sebha,
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/radio.png'),
                ),
                label: AppLocalizations.of(context)!.radio,
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings,
                backgroundColor: Theme.of(context).colorScheme.primary),
          ],
        ),
        body: tabs[index],
      ),
    ]);
  }

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
}
