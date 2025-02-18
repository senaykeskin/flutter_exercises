import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercises/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextField1 = FocusNode();
  FocusNode focusNodeTextField2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            focusNode: focusNodeTextField2,
            textInputAction: TextInputAction.next,
            // klavyeden, sonraki TextInput'a geçmek için
            maxLength: 40,
            buildCounter: (context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            autofillHints: [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [TextProjectInputFormatter()._formatter],
            decoration: _InputDecorator().emailInput,
          ),
          TextField(
            focusNode: focusNodeTextField1,
            minLines: 2,
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      key: key,
      duration: Duration(seconds: 1),
      color: Colors.green,
      height: 10,
      width: 10.0 * (currentLength ?? 0),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    // klavyeden a'ya basılmasını engellemek.
    return newValue.text.contains('a') ? oldValue : newValue;
  });
}

class _InputDecorator {
  final emailInput = InputDecoration(
    prefixIcon: Icon(Icons.mail),
    iconColor: Colors.red,
    labelText: LanguageItems.mailTitle,
    //fillColor: Colors.white,
    //filled: true
  );
}
