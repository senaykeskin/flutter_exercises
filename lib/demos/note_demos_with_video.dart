import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercises/101/image_learn.dart';

class NoteDemosWithVideo extends StatelessWidget {
  const NoteDemosWithVideo({super.key});

  final _title = "Create your first note!";
  final _description = "Add a note ";
  final _createNote = "Create a Note";
  final _importNotes = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding + PaddingItems.verticalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().book),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(
                title: _description * 10,
              ),
            ),
            const Spacer(),
            _createButton(context),
            TextButton(onPressed: () {},
                child: Text(
                    _importNotes,
                    style: TextStyle(fontSize: 20, color: Colors.blue)
                )
            ),
            SizedBox(height: ButtonHeights.buttonNormalHeight)
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              onPressed: () {},
              child: SizedBox(
                  height: ButtonHeights.buttonNormalHeight,
                  child: Center(
                      child: Text(
                          _createNote,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                        ),
                      )
                  )
              )
          );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
  EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}


class ButtonHeights {
  static const double buttonNormalHeight = 50;
}



// Center text widget
class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget(
      {super.key, this.textAlign = TextAlign.center, required this.title});

  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}