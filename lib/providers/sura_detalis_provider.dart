import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  getFileData(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> line = file.split('\n');
    verses = line;
    notifyListeners();
  }
}
