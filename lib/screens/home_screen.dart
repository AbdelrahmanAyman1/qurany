import 'package:flutter/material.dart';
import 'package:qurany/screens/tabs/ahadeth_tab.dart';
import 'package:qurany/screens/tabs/quran_tab.dart';
import 'package:qurany/screens/tabs/radio_tab.dart';
import 'package:qurany/screens/tabs/sebha_tab.dart';
import 'package:qurany/screens/tabs/settings_tab.dart';

import '../theme/my_theme_data.dart';

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
    return Stack(children: [
      Image.asset(
        'assets/images/backgraound.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text('قرأني', style: Theme.of(context).textTheme.bodyLarge),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/moshaf.png')),
                label: 'قرأن',
                backgroundColor: MyThemeData.primaryColor),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                ),
                label: 'احاديث',
                backgroundColor: MyThemeData.primaryColor),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/sebha.png'),
                ),
                label: 'سبحه',
                backgroundColor: MyThemeData.primaryColor),
            BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/radio.png'),
                ),
                label: 'راديو',
                backgroundColor: MyThemeData.primaryColor),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: 'الاعدادت',
                backgroundColor: MyThemeData.primaryColor),
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
