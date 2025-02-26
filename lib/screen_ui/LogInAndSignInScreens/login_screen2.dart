import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    final double W = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
        systemOverlayStyle:
            SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/pine-cone.png",
                    width: W * 0.30,
                    height: W * 0.30,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Sign In To Campus",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            InputWidget(
              W: W,
              isPassword: false,
              title: "Email Address",
              hintText: "email",
              icon: Icons.email_outlined,
            ),
            InputWidget(
              W: W,
              isPassword: true,
              title: "Password",
              hintText: "password",
              icon: Icons.lock_outlined,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    fixedSize: Size(W, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.white,
                        size: 25,
                      )
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(thickness: 2, color: Colors.grey[400])),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500])),
                  ),
                  Expanded(
                      child: Divider(thickness: 2, color: Colors.grey[400])),
                ],
              ),
            ),
            Container(
              width: W * 0.8,
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _socialMediaButton(W, FontAwesomeIcons.facebook),
                  _socialMediaButton(W, FontAwesomeIcons.google),
                  _socialMediaButton(W, FontAwesomeIcons.instagram),
                ],
              ),
            ),
            Container(
              width: W,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[800], fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.purple[800],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.purple[800],
                          decorationThickness: 2),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  ElevatedButton _socialMediaButton(double W, IconData icon) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          fixedSize: Size(W * 0.22, W * 0.22),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[200],
          side: BorderSide(color: Color(0xFFBDBDBD)),
          overlayColor: Colors.grey[600]),
      child: FaIcon(icon, size: 40, color: Color(0xff716c6c)),
    );
  }
}

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.W,
    required this.isPassword,
    required this.title,
    required this.hintText,
    required this.icon,
  });

  final double W;
  final bool isPassword;
  final String title;
  final String hintText;
  final IconData icon;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool visibility = false;

  void _changeVisibility() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(widget.icon),
                    //SizedBox(width: 5),
                    SizedBox(
                      width: widget.W * 0.73,
                      child: TextField(
                        obscureText: visibility,
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: widget.hintText,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey),
                            border: InputBorder.none,
                            suffixIcon: widget.isPassword
                                ? IconButton(
                                    onPressed: _changeVisibility,
                                    icon: Icon(visibility
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined))
                                : null),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
