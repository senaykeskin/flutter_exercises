import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key, this.userName}) : super(key: key);
  final String name = "Veli";

  final String? userName;

  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        ("Welcome $name ${name.length}"),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.right,
        style: ProjectStyles.welcomeStyle,
      ),

      Text(userName ?? ""),
      Text(keys.welcome),

      Text(
        ("Hello $name ${name.length}"),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.right,
        //style: ProjectStyles.welcomeStyle,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ProjectColors.welcomeColor),
      )
    ])));
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.red);
}

class ProjectColors {
  static Color welcomeColor = Colors.yellow;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
