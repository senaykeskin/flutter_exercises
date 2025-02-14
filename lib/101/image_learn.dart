import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  final String _imagePath = "https://ubf.akdeniz.edu.tr/assets/images/logo-single.png";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: PngImage(name: ImageItems().book),
          ),
          Image.network(
            _imagePath,
            errorBuilder: (context, error, stackTree) => Icon(Icons.abc_outlined),
          ),

        ],
      ),
    );
  }
}


class ImageItems {
  final String book = "book_image";
}


class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover,);
  }

  String get _nameWithPath => "assets/images/$name.jpeg";
}
