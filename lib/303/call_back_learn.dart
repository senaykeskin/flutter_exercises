import 'package:flutter/material.dart';
import 'package:flutter_exercises/product/widget/button/answer_button.dart';
import 'package:flutter_exercises/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallbackDropdown(onUserSelected: (CallbackUser user) {
            print(user);
          }),
          AnswerButton(onNumber: (number) {
            return number % 3 == 1;
          })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  //Important: dummy data
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser("vb", 123),
      CallbackUser("vb2", 124),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }
}
