/* TODO: Bu sayfadaki kodu Chatgpt yazdı.
*  "lib/demos/note_demos_view.dart" sayfasındaki kodu ben yazdım
*  ve sadeleştirmesini istedim.
*  TODO: incelenecek!
* */

import 'package:flutter/material.dart';

class GptNoteDemosView extends StatelessWidget {
  const GptNoteDemosView({super.key});

  final String _headerTitle = "Create Your First Note";
  final String _subtitle = "Add a note about anything your thoughts on climate change, or your history essay and share it with the world.";
  final String _buttonText = "Create A Note";
  final String _textButtonText = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImage(),
            _buildTitle(context),
            _buildSubtitle(context),
            _buildElevatedButton(context),
            _buildTextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return const SizedBox(
      height: 250,
      width: 250,
      child: Image(
        image: AssetImage("assets/images/book_image.jpeg"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Text(
        _headerTitle,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        _subtitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Colors.grey[600],
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff518ab4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        onPressed: () {},
        child: Text(
          _buttonText,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        _textButtonText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: const Color(0xff518ab4),
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}
