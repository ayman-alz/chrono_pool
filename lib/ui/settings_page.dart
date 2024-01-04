import 'dart:typed_data';

import 'package:chrono_pool/components/applocal.dart';
import 'package:chrono_pool/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chrono_pool/controller/settingController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../edit_player_name_widget.dart';
import '../model/score.dart';

enum PlayerNumber { UN, DEUX }

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsCode settingsCode = new SettingsCode();

  String player2ScoreValue = "0";
  String player1ScoreValue = "0";
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditPlayerName(),
            ),
            Card(
              child: Column(
                children: [
                  Text("Score", style: Theme.of(context).textTheme.displaySmall),
                  buildScoreRow(
                    PlayerNumber.UN,
                    "${getLang(context, "player1")}",
                  ),
                  buildScoreRow(
                    PlayerNumber.DEUX,
                    "${getLang(context, "player2")}",
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${getLang(context, "time_seconds")}",
                          style: Theme.of(context).textTheme.displaySmall),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${getLang(context, "orange_alarm")}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    "_"), // You can replace this with a TextField for better editing experience
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${getLang(context, "red_alarm")}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    "_"), // You can replace this with a TextField for better editing experience
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${getLang(context, "last_alarm")}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    "_"), // You can replace this with a TextField for better editing experience
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${getLang(context, "extention")}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    player1ScoreValue =
                                    settingsCode.playerButtonMinus(
                                        player1ScoreValue,
                                        "player1_score") as String;
                                  });
                                },
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                    player1ScoreValue), // You can replace this with a TextField for better editing experience
                              ),
                              IconButton(
                                onPressed: () async {
                                  setState(() {
                                    player1ScoreValue =
                                    settingsCode.playerButtonPlus(
                                        player1ScoreValue,
                                        "player1_score") as String;
                                  });
                                },
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Card(
              child: Column(
                children: [
                  Text("${getLang(context, "time_minute")}", style: Theme.of(context).textTheme.displaySmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${getLang(context, "match_time")}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_circle),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            "_"), // You can replace this with a TextField for better editing experience
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            // New Card Section for Choose a Photo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            _pickImage(ImageSource.gallery),
                        child: Text('Choose a Photo'),
                      ),
                      FutureBuilder<Uint8List?>(
                        future: _image?.readAsBytes(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            return Image.memory(snapshot.data!);
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScoreRow(PlayerNumber number, String playerName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(playerName,
              style: Theme.of(context).textTheme.headlineSmall),
          Spacer(),
          IconButton(
            onPressed: () async {
              player2ScoreValue = await settingsCode.playerButtonMinus(
                  player2ScoreValue, "player2_score") ;
              setState(() {
                if (number == PlayerNumber.UN) {
                  context.read<Score>().decScorePlayer1();
                } else {
                  context.read<Score>().decScorePlayer2();
                }

              });
            },
            icon: Icon(Icons.remove_circle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
            //Text(player2ScoreValue),
            number == PlayerNumber.UN
                ? Text(context.watch<Score>().player1Score.toString())
                : Text(context.watch<Score>().player2Score.toString()),
          ),
          IconButton(
            onPressed: () async {
              player2ScoreValue  = await settingsCode.playerButtonPlus(
                  player2ScoreValue, "player2_score") ;
              setState(() {
                if (number == PlayerNumber.UN) {
                  context.read<Score>().incScorePlayer1();
                } else {
                  context.read<Score>().incScorePlayer2();
                }

              });
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = XFile(pickedImage.path);
      });
    }
  }
}