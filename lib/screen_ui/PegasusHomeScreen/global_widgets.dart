import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../global/constants.dart';
import '../../global/global_variables.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black.withOpacity(0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0,
          fixedSize: Size(180, 50)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Hoş Geldin Alya",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "10,200 Puan",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          FaIcon(
            FontAwesomeIcons.circleUser,
            size: 25,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class DirectionalButtons extends StatefulWidget {
  const DirectionalButtons({super.key});

  @override
  _DirectionalButtonsState createState() => _DirectionalButtonsState();
}

class DirectionalButtonsState {}

class _DirectionalButtonsState extends State<DirectionalButtons> {
  bool isRoundTrip = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: radius25,
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment:
                isRoundTrip ? Alignment.centerLeft : Alignment.centerRight,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: 125,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: radius25,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isRoundTrip = true;
                    });
                  },
                  child: Center(
                    child: Text(
                      "Gidiş Dönüş",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isRoundTrip ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isRoundTrip = false;
                    });
                  },
                  child: Center(
                    child: Text(
                      "Tek Yön",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: !isRoundTrip ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectionButtons extends StatelessWidget {
  const SelectionButtons({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.icon,
  });

  final String leftText;
  final String rightText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: W(context),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent),
                onPressed: () {},
                child: Text(
                  leftText,
                  style: placeText,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent),
                onPressed: () {},
                child: Text(
                  rightText,
                  style: placeText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PassengerTypeButton extends StatelessWidget {
  const PassengerTypeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: horizontal10,
        margin: onlyTop15,
        width: W(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yolcular",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Text(
              "1 Yetişkin",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
    required this.lottiePath,
    required this.headerTitle,
    required this.subtitle,
  });

  final String lottiePath;
  final String headerTitle;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: W(context) * 0.95,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  lottiePath,
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 7),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headerTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.chevron_right_outlined, size: 30)
          ],
        ),
      ),
    );
  }
}
