import 'package:flutter/material.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});

  final _cardHeight = 50.0;
  final _cardWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Expanded(
                flex: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      bottom: _cardHeight / 2,
                      child: Image.asset("assets/images/book_image.jpeg",
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                        height: _cardHeight,
                        bottom: 0,
                        width: _cardWidth,
                        child: _cardCustom())
                  ],
                )),
          ),
          Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _cardCustom() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
