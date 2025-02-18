import 'package:flutter/material.dart';
import 'package:flutter_exercises/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustomValue = 0;
  final String _welcome = LanguageItems.welcomeTitle;

  void _updateCounter() {
    setState(() {
      ++_counterCustomValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _updateCounter,
        child: Text("$_welcome $_counterCustomValue"));
  }
}
