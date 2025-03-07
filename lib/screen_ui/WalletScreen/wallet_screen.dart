import 'package:flutter/material.dart';
import 'package:flutter_exercises/screen_ui/WalletScreen/button_list.dart';
import 'global_widgets.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff144419),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: HeaderArea(),
            ),
            Expanded(
              child: Container(
                width: W,
                height: H,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Color(0xffecf0e7)),
                child: Column(
                  children: [
                    card(context),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: buttonListElements.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: W * 0.4,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right:-4,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(55, 55),
                                        backgroundColor: Colors.white,
                                        shape: CircleBorder(
                                          side: BorderSide(
                                            width: 0.5,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.chevron_right_outlined,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: W * 0.4 - 45,
                                        margin: EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          buttonListElements[index]['title'] ?? "N/A",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff308037),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        child: Image.asset(
                                          buttonListElements[index]['image'] ??
                                              "N/A",
                                          fit: BoxFit.cover,
                                          height: 150,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
