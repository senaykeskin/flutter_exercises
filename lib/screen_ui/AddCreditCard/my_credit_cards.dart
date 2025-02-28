import 'package:flutter/material.dart';
import 'package:flutter_exercises/screen_ui/AddCreditCard/add_new_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'creditCardModel.dart';

class MyCreditCards extends StatefulWidget {
  final CreditCardModel? newCard;

  const MyCreditCards({super.key, this.newCard});

  @override
  State<MyCreditCards> createState() => _MyCreditCardsState();
}

class _MyCreditCardsState extends State<MyCreditCards> {
  static List<CreditCardModel?> creditCards = [];

  @override
  void initState() {
    super.initState();
    if (widget.newCard != null) {
      creditCards.add(widget.newCard);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color darkGreen = Color(0xff0e5053);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0))),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Cards",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: darkGreen, width: 1.5),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNewCard()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Cards",
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.add_rounded,
                        color: darkGreen,
                        size: 20,
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: creditCards.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueGrey.shade900,
                                Colors.blueGrey.shade800,
                                Colors.blueGrey.shade600,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                left: 20,
                                child: _getCardIcon(creditCards[index]!.icon) ??
                                    Container()),
                            Positioned(
                              top: 70,
                              left: 20,
                              right: 20,
                              child: Text("Card Number",
                                  style: TextStyles().titles),
                            ),
                            Positioned(
                              top: 90,
                              left: 20,
                              child: Text(
                                creditCards[index]!.cardNumber,
                                style: TextStyles().values,
                              ),
                            ),
                            Positioned(
                                bottom: 20,
                                left: 20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Exp",
                                      style: TextStyles().titles,
                                    ),
                                    Text(
                                      "${creditCards[index]!.expiryMonth} / ${creditCards[index]!.expiryYear}",
                                      style: TextStyles()
                                          .values
                                          .copyWith(fontSize: 16),
                                    )
                                  ],
                                ))
                          ],
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget? _getCardIcon(dynamic type) {
  switch (type) {
    case "master":
      return FaIcon(
        FontAwesomeIcons.ccMastercard,
        size: 50,
        color: Colors.redAccent,
      );
    case "visa":
      return FaIcon(FontAwesomeIcons.ccVisa, size: 50, color: Colors.blue);
    case "paypal":
      return FaIcon(FontAwesomeIcons.ccPaypal, size: 50, color: Colors.white);
    default:
      return null;
  }
}

class TextStyles {
  TextStyle values = TextStyle(
    fontSize: 19,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  TextStyle titles = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}
