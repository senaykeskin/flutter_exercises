import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_exercises/global/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'global_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> images = [
    "assets/images/pegasus1.jpg",
    "assets/images/pegasus2.jpg",
    "assets/images/pegasus3.jpg",
    "assets/images/pegasus4.webp",
    "assets/images/pegasus5.webp",
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 23), (Timer timer) {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // Column yerine Stack kullanıyoruz
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.37,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            left: 15,
            child: Row(
              children: List.generate(images.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: _currentIndex == index ? 15 : 8,
                  height: _currentIndex == index ? 5 : 6,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.grey[600],
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: [
                ProfileContainer(),
                SizedBox(width: 7),
                FaIcon(FontAwesomeIcons.bell)
              ],
            ),
          ),
          Positioned(
            top: H(context) * 0.35,
            left: (W(context) * 0.05) / 2,
            child: Container(
              width: W(context) * 0.95,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(-2, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  DirectionalButtons(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DirectionalButtons extends StatelessWidget {
  const DirectionalButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "dataaaa",
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }
}
