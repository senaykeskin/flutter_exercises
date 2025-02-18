import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CircularProgress()],
      ),
      body: LinearProgressIndicator(),
    );
  }
}

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          strokeWidth: 10,
          value: 0.9,
          backgroundColor: Colors.white,
        )
    );
  }
}
