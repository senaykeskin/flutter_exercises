import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderArea extends StatelessWidget {
  const HeaderArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Money",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        SizedBox(
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Color(0xff317f37),
                    borderRadius: BorderRadius.circular(40)),
                child: Icon(Icons.shopping_basket_outlined),
              ),
              Container(
                height: 10,
                width: 15,
                color: Color(0xff317f37),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Color(0xff317f37),
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Image.asset("assets/images/woman.png")),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Column card(BuildContext context) {
  double W = MediaQuery.of(context).size.width;
  double H = MediaQuery.of(context).size.height;

  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15),
        height: H * 0.25,
        width: W,
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 15,
                  child: Text(
                    "Cash Balance",
                    style: TextStyle(
                        color: Color(0xff327e38),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )),
              Positioned(
                  top: 13,
                  right: 65,
                  child: Text(
                    "Account & Routing",
                    style: TextStyle(
                        color: Color(0xff327e38),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Color(0xff327e38)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_right_outlined,
                        size: 35,
                        color: Colors.white,
                      ))),
              Positioned(
                  top: (H * 0.25) / 3,
                  left: 10,
                  child: Text(
                    "\$5,440.17",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff327e38)),
                  )),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    _addAndOutCashButtons(
                        icon: FontAwesomeIcons.moneyBill,
                        title: "Add Cash",
                        backgroundColor: Color(0xff308037),
                        textColor: Colors.white),
                    Container(
                      height: 10,
                      width: 15,
                      color: Color(0xffecf1e9),
                    ),
                    _addAndOutCashButtons(
                        icon: Icons.telegram_outlined,
                        title: "Cash Out",
                        backgroundColor: Color(0xffecf1e9),
                        textColor: Color(0xff308037))
                  ]))
            ],
          ),
        ),
      )
    ],
  );
}

ElevatedButton _addAndOutCashButtons(
    {required IconData icon,
    required String title,
    required Color backgroundColor,
    required Color textColor}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        fixedSize: Size(156, 50),
        elevation: 0,
        backgroundColor: backgroundColor),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: textColor,
          size: 25,
        ),
        SizedBox(width: 7),
        Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
        )
      ],
    ),
  );
}
