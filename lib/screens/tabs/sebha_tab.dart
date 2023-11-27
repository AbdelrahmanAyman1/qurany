import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            const SizedBox(height: 30),
            Image.asset('assets/images/head_of_seb7a.png'),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * .088),
                child: Image.asset('assets/images/body_of_seb7a.png'))
          ],
        ),
      ],
    );
  }
}
