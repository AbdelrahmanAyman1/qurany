import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AhadethDetailsProvider extends ChangeNotifier {
  String text = '';

  getHadethData(int index) async {
    String file = await rootBundle.loadString('assets/files/h${index + 1}.txt');
    text = file;
    notifyListeners();
  }
}
