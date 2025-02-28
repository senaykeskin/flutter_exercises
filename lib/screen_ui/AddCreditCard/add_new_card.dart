import 'package:flutter/material.dart';
import 'package:flutter_exercises/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'creditCardModel.dart';

class AddNewCard extends StatefulWidget {
  final CreditCardModel? newCard;

  const AddNewCard({super.key, this.newCard});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryMonthController = TextEditingController();
  final TextEditingController expiryYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  String? selectedValue;
  bool isEmpty = false;

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryMonthController.dispose();
    expiryYearController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(cardNumberControl);
  }

  final Color darkGreen = Color(0xff0e5053);

  @override
  Widget build(BuildContext context) {

    final double W = MediaQuery.of(context).size.width;
    final double H = MediaQuery.of(context).size.height;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkGreen,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 30,
            )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0))),
        backgroundColor: darkGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add your card",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fullscreen_exit_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Fill in the fields below or use camera phone",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Your card number",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 70,
              width: W,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 80,
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      items: [
                        DropdownMenuItem(
                          value: "master",
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.ccMastercard,
                            size: 40,
                            color: Colors.redAccent,
                          ),
                        ),
                        DropdownMenuItem(
                          value: "visa",
                          alignment: Alignment.center,
                          child: FaIcon(
                            FontAwesomeIcons.ccVisa,
                            size: 40,
                            color: Colors.blue[700],
                          ),
                        ),
                        DropdownMenuItem(
                            value: "paypal",
                            alignment: Alignment.center,
                            child: FaIcon(FontAwesomeIcons.ccPaypal, size: 40)),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: W * 0.65,
                    child: TextField(
                      controller: cardNumberController,
                      maxLength: 19,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                          hintText: "xxxx xxxx xxxx xxxx",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiry Date",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        width: W * 0.4,
                        height: H * 0.08,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: expiryMonthController,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintText: "01",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2,
                              child: VerticalDivider(
                                color: Colors.grey[400],
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: expiryYearController,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  hintText: "28",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: W * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVV2",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.only(top: 10),
                          width: W * 0.4,
                          height: H * 0.08,
                          child: TextField(
                            controller: cvvController,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              hintText: "000",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      _addButton(context),
                      isEmpty
                          ? Text(
                              "Fill in the fields before",
                              style: TextStyle(fontSize: 15, color: Colors.red),
                            )
                          : Container(),
                    ],
                  )),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: H * 0.18,
                width: W * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(
                              W * 0.7,
                              (H * 0.18) / 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          foregroundColor: Colors.grey),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.center_focus_weak_rounded,
                            size: 35,
                            color: darkGreen,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Scan card info by camera",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(
                              W * 0.7,
                              (H * 0.18) / 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          foregroundColor: Colors.grey),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.face, size: 35, color: darkGreen),
                          SizedBox(width: 10),
                          Text(
                            "Add Face ID",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
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

  ElevatedButton _addButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff1e959a),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {
        addCard();
      },
      child: Text(
        "Add",
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }

  void cardNumberControl() {
    String text = cardNumberController.text.replaceAll(" ", "");
    String formattedText = "";

    for (int i = 0; i < text.length; i++) {
      formattedText += text[i];
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        formattedText += " ";
      }
    }

    int newCursorPosition = cardNumberController.selection.baseOffset;

    if (cardNumberController.text.length < formattedText.length) {
      newCursorPosition += 1;
    } else if (cardNumberController.text.length > formattedText.length) {
      newCursorPosition -= 1;
    }

    cardNumberController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
          offset: newCursorPosition.clamp(0, formattedText.length)),
    );
  }

  void addCard() {
    if ((cardNumberController.text != "") &&
        (expiryMonthController.text != "") &&
        (expiryYearController.text != "") &&
        (cvvController.text != "") &&
        (selectedValue != null)) {
      CreditCardModel newCard = CreditCardModel(
          cardNumber: cardNumberController.text,
          expiryMonth: expiryMonthController.text,
          expiryYear: expiryYearController.text,
          cvv: cvvController.text,
          icon: selectedValue.toString());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyCreditCards(newCard: newCard),
        ),
      );
    } else {
      setState(() {
        isEmpty = true;
      });
    }
  }
}
