import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../edit_player_name_widget.dart';
import '../model/score.dart';
import '../controller/settings_controller.dart';
import '../components/applocal.dart';

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
  int _currentIndex = 0;
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
        child: Consumer<SettingsController>(
          builder: (context,set,oldWidget) {
            return Column(
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
                        "${getLang(context, "player1")}",set
                      ),
                      buildScoreRow(
                        PlayerNumber.DEUX,
                        "${getLang(context, "player2")}",set
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${getLang(context, "time_seconds")}",
                            style: Theme.of(context).textTheme.displaySmall),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RowSetting(DataType.ORANGE_ALARM,set,"orange_alarm"),
                            RowSetting(DataType.RED_ALARM,set,"red_alarm"),
                            RowSetting(DataType.LAST_ALARM,set,"last_alarm"),
                            RowSetting(DataType.EXTENTION,set,"extention"),
                          ],
                        ),
                      ],
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
                      RowSetting(DataType.MATCH_TIME,set,"match_time"),
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
            );
          }
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_rounded), // Icon for the first tab
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit), // Icon for the second tab
            label: 'Tab 2',
          ),
        ],
      ),
    );
  }

  Widget buildScoreRow(PlayerNumber number, String playerName,SettingsController set) {
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
              player2ScoreValue = await set.playerButtonMinus(
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
              player2ScoreValue  = await set.playerButtonPlus(
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

class RowSetting extends StatelessWidget {
  final DataType type;
  final SettingsController set;
  final String label;

  RowSetting(this.type, this.set, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("${getLang(context, label)}",
            style: Theme.of(context)
                .textTheme
                .headlineSmall),
        Spacer(),
        IconButton(
          onPressed: () {set.decType(type);},
          icon: Icon(Icons.remove_circle),
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 8.0),
          child: FutureBuilder<int>(
            future: set.getData(type),
            builder: (context, snapshot) =>Text(snapshot.data?.toString()??"-")
          ), // You can replace this with a TextField for better editing experience
        ),
        IconButton(
          onPressed: () {set.incType(type);},
          icon: Icon(Icons.add_circle),
        ),
      ],
    );
  }
}