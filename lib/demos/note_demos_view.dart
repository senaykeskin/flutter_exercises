import 'package:flutter/material.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});

  final String _headerTitle = "Create Your First Note";
  final String _subtitle = "Add a note about anything your thoughts on climate"
      "change, or your history  essay and share it with the world.";
  final String _buttonText = "Create A Note";
  final String _textButtonText = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff84dba1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Image.asset(
                  "assets/images/book_image.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _headerTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  _subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 80,
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff518ab4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {},
                child: Text(
                  _buttonText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                      _textButtonText,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Color(0xff518ab4),
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

//class SetPadding {
//  final EdgeInsets paddingValue = EdgeInsets.only(top: 20);
//}
