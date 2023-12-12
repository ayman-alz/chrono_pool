import 'package:flutter/material.dart';

import 'components/applocal.dart';

class EditPlayerName extends StatelessWidget {
  const EditPlayerName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Text("${getLang(context, "players_name")}",
                style: Theme.of(context).textTheme.displaySmall),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "${getLang(context, "player1")}",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "${getLang(context, "player2")}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
