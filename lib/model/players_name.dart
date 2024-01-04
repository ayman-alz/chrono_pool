import 'package:flutter/cupertino.dart';



class Players extends ChangeNotifier {
  String _player1Name = "Player 1";
  String _player2Name = "Player 2";



  //Changement Nom Joueurs
   String get player2Name => _player2Name;

   set player2Name(String value) {
     _player2Name = value;
     notifyListeners();

   }

   String get player1Name => _player1Name;

   set player1Name(String value) {
     _player1Name = value;
     notifyListeners();
   }
    }