import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.blue)),
                  Expanded(child: Container(color: Colors.grey)),
                  Expanded(child: Container(color: Colors.pink)),
                  Expanded(child: Container(color: Colors.brown)),
                ],
              )),
          Spacer(flex: 2),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // min size'a ayarlar.
                children: [
                  Text("a1"),
                  Text("a2"),
                  Text("a3"),
                ],
              )),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: [
                Expanded(child: Text("data")),
                Expanded(child: Text("data")),
                Expanded(child: Text("data")),
                Expanded(child: Text("data")),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class ProjectContainerSizes {
  static const double cardHeight = 200;
}
