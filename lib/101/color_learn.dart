import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: ColorsItem.patrice,
        child: const Text("data"),
      ),
    );
  }
}

class ColorsItem {
  static const  Color patrice = Color(0xff84dba1);
  static const  Color shakespeare = Color.fromRGBO(95, 155, 85, 1);
}
