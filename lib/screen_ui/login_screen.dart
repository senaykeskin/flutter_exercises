import 'package:flutter/material.dart';
import 'package:flutter_exercises/global/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final String _headerTitle = "Create an account";
  final String _signUp = "Sign up with";
  final String _userName = "Username";
  final String _email = "Email";
  final String _password = "Password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff434554), Color(0xff1e1e2a), Color(0xff10101c)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_circle_left, size: 45),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          _headerTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      Padding(
                        padding: onlyTop15,
                        child: Text(
                          _signUp,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Container(
                        margin: onlyTop15,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _signUpButton(
                                path: "assets/icons/google.png",
                                name: "Google",
                                context: context),
                            _signUpButton(
                                path: "assets/icons/facebook.png",
                                name: "Facebook",
                                context: context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: onlyTop15,
                    child: Column(
                      children: [
                        _inputArea(
                            context: context,
                            title: _userName,
                            decoration: _InputDecorator().userNameInput),
                        _inputArea(
                            context: context,
                            title: _email,
                            decoration: _InputDecorator().emailInput),
                        _inputArea(
                            context: context,
                            title: _password,
                            decoration: _InputDecorator().passwordInput),
                      ],
                    )),
                Padding(
                  padding: onlyTop50,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w400),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _inputArea(
      {required BuildContext context,
      required String title,
      required InputDecoration decoration}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: TextField(
                focusNode: FocusNode(),
                maxLength: 40,
                minLines: 1,
                decoration: decoration),
          ),
        ],
      ),
    );
  }

  SizedBox _signUpButton(
      {required String path, name, required BuildContext context}) {
    return SizedBox(
      width: 180,
      height: 90,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: radius)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                path,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 10),
              Text(name, style: Theme.of(context).textTheme.titleLarge),
            ],
          )),
    );
  }
}

class _InputDecorator {
  final userNameInput = InputDecoration(
    border: UnderlineInputBorder(),
    hintText: "username",
    hintStyle: TextStyle(color: Colors.grey),
  );

  final emailInput = InputDecoration(
    border: UnderlineInputBorder(),
    hintText: "example@mail.com",
    hintStyle: TextStyle(color: Colors.grey),
  );

  final passwordInput = InputDecoration(
    border: UnderlineInputBorder(),
    hintText: "xxxxxx",
    hintStyle: TextStyle(color: Colors.grey),
  );
}
