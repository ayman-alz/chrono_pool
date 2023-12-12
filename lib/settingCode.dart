
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsCode {



  Future<String> playerButtonMinus (String value , String key) async {

    SharedPreferences sharedprefrences = await SharedPreferences.getInstance();

    int savedScore = sharedprefrences.getInt(key) ?? 0 ;
    print("$savedScore");
    int score = int.tryParse(value) ?? 0;
    if (score > 0) {
      score = score - 1;
    }
    sharedprefrences.setInt(key, score);
    return score.toString();

  }

  Future<String> playerButtonPlus(String value, String key) async {
    SharedPreferences sharedprefrences = await SharedPreferences.getInstance();

    int savedScore = sharedprefrences.getInt(key) ?? 0 ;
    print("$savedScore");
    int score = int.tryParse(value) ?? 0;

      score = score +1;

    sharedprefrences.setInt(key, score);
    return score.toString();
  }
}


