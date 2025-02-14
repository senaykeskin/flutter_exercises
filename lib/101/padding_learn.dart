import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  color: Colors.white,
                  height: 100,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: EdgeInsets.zero,
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
                padding: ProjectPadding.pagePaddingRightOnly + ProjectPadding.pagePaddingVertical,
                child: const Text("data")
            ),
          ],
        ),
      ),
    );
  }
}


class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.only(right: 40);
  static const pagePaddingRightOnly = EdgeInsets.symmetric(vertical: 10);
}
