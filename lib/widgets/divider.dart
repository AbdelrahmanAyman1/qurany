import 'package:flutter/material.dart';

import '../theme/my_theme_data.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 3, color: MyThemeData.primaryColor);
  }
}
