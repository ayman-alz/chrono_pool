import 'package:flutter/material.dart';

class Score extends ChangeNotifier{
  String _player1Name = "Player 1";
  String _player2Name = "Player 2";
  int _player1Score = 0;
  int _player2Score = 0;

  Score();


  incScorePlayer1() {
    _player1Score++;
    notifyListeners();
  }
  decScorePlayer1() {
    _player1Score--;
    notifyListeners();
  }

  resetScorePlayer1(){
    _player1Score = 0;
    notifyListeners();
  }
  incScorePlayer2() {
    _player2Score++;
    notifyListeners();
  }
  decScorePlayer2() {
    _player2Score--;
    notifyListeners();
  }
  resetScorePlayer2(){
    _player2Score = 0;
    notifyListeners();
  }

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

  int get player2Score => _player2Score;
  int get player1Score => _player1Score;

}