import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_exercises/global/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../../product/constants/duration_items.dart';
import 'global_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration:
            Duration(milliseconds: _currentIndex == images.length ? 100 : 800),
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
      backgroundColor: Color(0xfff1f4f6),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: H(context) * 0.37,
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
            top: H(context) * 0.32,
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
                    borderRadius: radius20,
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
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: H(context) * 0.27),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: all10,
                    width: W(context) * 0.95,
                    height: H(context) * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: radius10,
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
                        SelectionButtons(
                          leftText: "Nereden?",
                          rightText: "Nereye?",
                          icon: Icons.swap_horiz_outlined,
                        ),
                        Dash(
                            direction: Axis.horizontal,
                            length: W(context) * 0.85,
                            dashLength: 6,
                            dashThickness: 2,
                            dashBorderRadius: 5,
                            dashGap: 7,
                            dashColor: Colors.grey[200] as Color),
                        SelectionButtons(
                          leftText: "Gidiş Tarihi",
                          rightText: "Dönüş Tarihi?",
                          icon: Icons.calendar_month_outlined,
                        ),
                        SizedBox(
                          width: W(context) * 0.85,
                          child: Divider(
                            color: Colors.grey[200],
                          ),
                        ),
                        PassengerTypeButton(),
                        Padding(
                          padding: vertical10,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfffdb913),
                              shape: RoundedRectangleBorder(
                                  borderRadius: radius10),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              fixedSize: Size(W(context), 30),
                            ),
                            onPressed: () {},
                            child: Text(
                              "UCUZ UÇUŞ ARA",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  BottomButtons(
                      lottiePath: "assets/lottie/service.json",
                      headerTitle: "Ek Hizmetleri",
                      subtitle: "Uçuşuna Ekle"),
                  BottomButtons(
                      lottiePath: "assets/lottie/coin.json",
                      headerTitle: "BolPuan kazanmak için",
                      subtitle: "Hemen Oyna"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
