
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/applocal.dart';
import '../score.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: Icon(Icons.logo_dev),
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(Icons.cast),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/Settings");
              },
            )
          ]),
      body: Column(
        children: [
          Container(
            height: 65.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "${getLang(context,"extention")}",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Row(children: [
            Text("${context.watch<Score>().player1Name} : ${context.watch<Score>().player1Score}",
              style: Theme.of(context).textTheme.headlineSmall,),
            Spacer(),
            Text("${context.watch<Score>().player2Name} : ${context.watch<Score>().player2Score}",
              style: Theme.of(context).textTheme.headlineSmall,)
          ],),
          Flexible(child: Container(color: Colors.black)),
          Image.network(
              'https://upload.wikimedia.org/wikipedia/fr/b/b2/Logo_Parcs_nationaux_de_France.png',
              height: 150.0)
        ],
      ),
    );
  }
}
