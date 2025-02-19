import 'dart:math';
import 'package:flutter/material.dart';

class WeightAppScreen extends StatefulWidget {
  const WeightAppScreen({super.key});

  @override
  State<WeightAppScreen> createState() => _WeightAppScreenState();
}

class _WeightAppScreenState extends State<WeightAppScreen> {
  final String _headerTitle = "Lose weight in 30 days!";
  final String _subtitle = "Everyday you have to maintain this rule!";
  final String _buttonText = "30 days left";

  final String _listButtonTitle = "Day";
  final String _listButtonSubtitle = "Exercises";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_customAppBar(context)],
      ),
      body: Padding(
        padding: _PagePaddings.generalPagePadding,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(_ImagePaths.fitnessApp),
                ),
                Padding(
                  padding: _PagePaddings.all20,
                  child: Text(
                    _headerTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      _subtitle,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: _PageBorderRadius.border10)),
                    onPressed: () {},
                    child: Text(
                      _buttonText,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: _PagePaddings.top15,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return _Card(
                        index: index,
                        buttonTitle: _listButtonTitle,
                        subtitle: _listButtonSubtitle,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _customAppBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: _PagePaddings.horizontal20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CustomSizedBox(iconName: Icons.chevron_left),
            _CustomSizedBox(iconName: Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.index,
    required this.buttonTitle,
    required this.subtitle,
  });

  final int index;
  final String buttonTitle, subtitle;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomNumber = random.nextInt(21) + 1;

    return Card(
      margin: EdgeInsets.only(bottom: 15),
      color: Colors.blueGrey[900],
      child: ListTile(
        title: Text(buttonTitle),
        subtitle: Text('$randomNumber $subtitle'),
        trailing: Container(
          margin: _PagePaddings.onlyRight20,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chevron_right_outlined,
                size: 35,
              )),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.purpleAccent.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: _PageBorderRadius.border15),
            child: Center(
              child: Text(
                index < 9 ? "0${index + 1}" : "${index + 1}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomSizedBox extends StatelessWidget {
  const _CustomSizedBox({
    required this.iconName,
  });

  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: _PageBorderRadius.border10),
      child: IconButton(
        onPressed: () {},
        icon: Icon(iconName, size: 30),
        style: ButtonStyle(alignment: Alignment.center),
        color: Colors.white,
      ),
    );
  }
}

class _PagePaddings {
  static const EdgeInsets horizontal20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets all20 = EdgeInsets.all(20);
  static const EdgeInsets top15 = EdgeInsets.only(top: 15);
  static const EdgeInsets onlyRight20 = EdgeInsets.only(right: 20);
  static const EdgeInsets generalPagePadding =
      EdgeInsets.only(top: 20, left: 20, right: 20);
}

class _PageBorderRadius {
  static BorderRadiusGeometry border10 = BorderRadius.circular(10);
  static BorderRadiusGeometry border15 = BorderRadius.circular(15);
}

class _ImagePaths {
  static String fitnessApp = "assets/images/fitness_app_image.png";
}
