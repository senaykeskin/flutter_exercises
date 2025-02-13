import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.white,
                height: 100,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              color: Colors.white,
              height: 100,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20), child: const Text("data")),
        ],
      ),
    );
  }
}
