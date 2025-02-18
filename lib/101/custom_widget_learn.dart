import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  CustomWidgetLearn({super.key});

  final String food = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Padding(
            padding: _PaddingUtility().horizontalPadding,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFoodButton(food: food, onpressed: () {})),
          )),
          SizedBox(height: 100),
          CustomFoodButton(
            food: food,
            onpressed: () {}
          )
        ],
      ),
    );
  }
}

class _ColorUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = EdgeInsets.all(16.0);
  final EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 10);
}

class CustomFoodButton extends StatelessWidget {
  const CustomFoodButton(
      {super.key, required this.food, required this.onpressed});

  final String food;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: _ColorUtility().redColor, shape: StadiumBorder()),
        onPressed: onpressed,
        child: Padding(
          padding: _PaddingUtility().normal2xPadding,
          child: Text(
            food,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: _ColorUtility().whiteColor, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
