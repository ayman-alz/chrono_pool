import 'package:chrono_pool/components/applocal.dart';
import 'package:chrono_pool/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(Settings());

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CHRONO 8 POOL",
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
        // Use the default AppBar back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyApp()));              },
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
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Container(
                  child: Column(
                    children: [
                      Text("${getLang(context,"players_name")}",
                          style: Theme.of(context).textTheme.displaySmall),
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "${getLang(context,"player1")}",
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "${getLang(context,"player2")}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Score", style: Theme.of(context).textTheme.displaySmall),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${getLang(context,"player1")}", style: Theme.of(context).textTheme.headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("_"), // You can replace this with a TextField for better editing experience
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
                              Text("${getLang(context,"player2")}", style: Theme.of(context).textTheme.headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("_"), // You can replace this with a TextField for better editing experience
                              ),
                              IconButton(
                                onPressed: () {},
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
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${getLang(context,"time_seconds")}"
                          , style: Theme.of(context).textTheme.displaySmall),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${getLang(context,"orange_alarm")}", style: Theme.of(context).textTheme.headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("_"), // You can replace this with a TextField for better editing experience
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
                              Text("${getLang(context,"red_alarm")}", style: Theme.of(context).textTheme.headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(""), // You can replace this with a TextField for better editing experience
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
                              Text("${getLang(context,"last_alarm")}", style: Theme.of(context).textTheme.headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("_"), // You can replace this with a TextField for better editing experience
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
                              Text("${getLang(context,"extention")}", style: Theme.of(context).textTheme.headlineSmall),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_circle),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("_"), // You can replace this with a TextField for better editing experience
                              ),
                              IconButton(
                                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}