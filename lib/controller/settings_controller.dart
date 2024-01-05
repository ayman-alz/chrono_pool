
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DataType{PLAYER_1,PLAYER_2,ORANGE_ALARM,RED_ALARM,LAST_ALARM,EXTENTION,MATCH_TIME,}

class SettingsController with ChangeNotifier{

Future<String> playerButtonMinus (String value , String key) async {
  SharedPreferences sp =await SharedPreferences.getInstance();

  int savedScore = sp.getInt(key) ?? 0 ;
    print("$savedScore");
    int score = int.tryParse(value) ?? 0;
    if (score > 0) {
      score = score - 1;
    }
    sp.setInt(key, score);
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

  Future<int> getData(DataType type) async{
    SharedPreferences sharedprefrences = await SharedPreferences.getInstance();
    return sharedprefrences.getInt(type.name) ?? 0 ;
  }
  Future<int> incType(DataType type)async{
    SharedPreferences sharedprefrences = await SharedPreferences.getInstance();
    var storedData = await getData(type);
    storedData++;
    await sharedprefrences.setInt(type.name,storedData);
    notifyListeners();
    return storedData;
  }
  Future<int> decType(DataType type)async{
    SharedPreferences sharedprefrences = await SharedPreferences.getInstance();
    var storedData = await getData(type);
    storedData--;
    await sharedprefrences.setInt(type.name,storedData);
    notifyListeners();
    return storedData;
  }




}


