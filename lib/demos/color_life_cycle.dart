import 'package:flutter/material.dart';
import 'package:flutter_exercises/demos/color_demos_view.dart';

class ColorLifeCycle extends StatefulWidget {
  const ColorLifeCycle({super.key});

  @override
  State<ColorLifeCycle> createState() => _ColorLifeCycleState();
}

class _ColorLifeCycleState extends State<ColorLifeCycle> {

  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _changeBackground, icon: Icon(Icons.clear))],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(child: ColorDemosView(
            initialColor: _backgroundColor
          ))
        ],
      ),
    );
  }

  void _changeBackground() {
    setState(() {
      _backgroundColor = Colors.pink[200];
    });
  }


}


