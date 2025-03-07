import 'package:flutter/material.dart';

import "index.dart";

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<ResourceContext>(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,

      /*
      theme: ThemeData.dark().copyWith(

        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label,
        ),
          bottomAppBarTheme: BottomAppBarTheme(
            shape: CircularNotchedRectangle()
          ),

          listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
          inputDecorationTheme: InputDecorationTheme(
            iconColor: Colors.red,
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Colors.white),
          cardTheme: CardTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light)),
       */

      home: WalletScreen(),
    );
  }
}
