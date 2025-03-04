import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final response = await showDialog(
            context: context,
            builder: (context) {
              return _ImageZoomDialog();
            });
      }),
      appBar: AppBar(),
    );
  }
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    super.key,
  });

  final String _url = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer( // resim zoomlama
        child: Image.network(_url,
        fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}

class Keys {
  static const versionUpdate = "Version update!";
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context}) :
  super(
        title: Text(Keys.versionUpdate),
        actions: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context, true);
          }, child: Text("update")),
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Close"))
        ],
      );
}


class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Version update!"),
      actions: [
        ElevatedButton(onPressed: () {
          Navigator.pop(context, true);
        }, child: Text("update")),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Close"))
      ],
    );
  }
}
