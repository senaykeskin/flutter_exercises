import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});

  final String _title = "Welcome Learn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.mark_email_unread_sharp)
          ),
          //const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }

}