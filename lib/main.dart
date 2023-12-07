import 'dart:ffi';
import 'dart:math';

import 'package:chrono_pool/components/applocal.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:chrono_pool/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CHRONO 8 POOL",
      routes: {
        '/Settings': (context) => Settings(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "CHRONO 8 POOL"),
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fr", ""),
        Locale("en", ""),
      ],
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: Icon(Icons.logo_dev),
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.cast),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Settings()));
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
          Flexible(child: Container(color: Colors.black)),
          Image.network(
              'https://upload.wikimedia.org/wikipedia/fr/b/b2/Logo_Parcs_nationaux_de_France.png',
              height: 150.0)
        ],
      ),
    );
  }
}
