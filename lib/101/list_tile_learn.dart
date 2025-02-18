import 'package:flutter/material.dart';
import '../core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  final imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: RandomImage(),
                  onTap: () {},
                  subtitle: Text("How do you use your card?"),
                  leading: Container(height: 100, width: 30, alignment: Alignment.bottomCenter, color: Colors.red, child: Icon(Icons.money)),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
