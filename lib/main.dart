import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercises/demos/gpt_note_demos_view.dart';
//import 'package:flutter_exercises/101/image_learn.dart';
import 'package:flutter_exercises/demos/note_demos_view.dart';
//import 'package:flutter_exercises/101/color_learn.dart';
//import 'package:flutter_exercises/101/stateless_learn.dart';
//import 'package:flutter_exercises/101/app_bar_view.dart';
//import 'package:flutter_exercises/101/icon_learn.dart';
//import 'package:flutter_exercises/101/button_learn.dart';
// import 'package:flutter_exercises/101/container_sized_box_learn.dart';
// import 'package:flutter_exercises/101/scaffold_learn.dart';
// import 'package:flutter_exercises/101/text_learn_view.dart';
//import 'package:flutter_exercises/101/card_learn.dart';
//import 'package:flutter_exercises/101/padding_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
            backgroundColor: Colors.red,
            elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light
        )
      ),
      home: NoteDemosView(),
    );
  }
}
