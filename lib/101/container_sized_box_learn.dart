import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text("a" * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text("b" * 50),
          ),
          Container(
            height: 50,
            constraints: const BoxConstraints(
                maxWidth: 150, minWidth: 100, maxHeight: 100),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Text("cc"),
            decoration: ProjectUtility.boxDecoration,
            ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: [
        BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
      ],
      border: Border.all(width: 10, color: Colors.white12));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
          boxShadow: [
            BoxShadow(
                color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
          ],
          border: Border.all(width: 10, color: Colors.white12),
        );
}
