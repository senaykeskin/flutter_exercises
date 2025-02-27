import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print("a");
        },
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
                items: [
                  DropdownMenuItem(value: "v1", child: Text("a")),
                  DropdownMenuItem(value: "v2", child: Text("a")),
                  DropdownMenuItem(value: "v3", child: Text("a")),
                ],
                onChanged: (value) {}
            ),

            CheckboxListTile(value: true, onChanged: (value) {}),

            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print("okey");
                  }
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage.notEmpty;
  }
}

class ValidatorMessage {
  static const String notEmpty = "boş olamaz";
}
