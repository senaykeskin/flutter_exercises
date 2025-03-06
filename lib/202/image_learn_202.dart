import 'package:flutter/material.dart';
import 'package:flutter_exercises/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          context.read<ResourceContext>().clear();
        }, icon: Icon(Icons.remove))],
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ""),
      ),
      //body: Image.asset(ImagePaths.sea_image.toPng()),
      body: ImagePaths.sea_image.toWidget(height: 100),
    );
  }
}

enum ImagePaths {
  sea_image;
}

extension ImagePathsExt on ImagePaths {
  String toPng() {
    return 'assets/images/$name.png';
  }

  String toJpeg() {
    return 'assets/images/$name.jpeg';
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(
      toPng(),
      height: height,
    );
  }
}
