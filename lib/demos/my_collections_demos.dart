import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({super.key});

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          padding: PaddingUtility().paddingHorizontal,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          }),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required this.model,
  });

  final CollectionModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingAll,
        child: Column(
          children: [
            Image.asset(model.imagePath),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.title),
                  Text('${model.price} eth'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(
      {required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.imagePath,
          title: "Abstract Art",
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imagePath,
          title: "Abstract Art2",
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imagePath,
          title: "Abstract Art3",
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imagePath,
          title: "Abstract Art4",
          price: 3.4),
    ];
  }
}

class PaddingUtility {
  final paddingTop = EdgeInsets.only(top: 10);
  final paddingAll = EdgeInsets.all(20);
  final paddingBottom = EdgeInsets.only(bottom: 20);
  final paddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
}

class ProjectImages {
  static const imagePath = "assets/images/sea_image.png";
}
