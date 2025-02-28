import 'package:flutter/cupertino.dart';

class CreditCardModel {
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;
  final String icon;

  CreditCardModel({
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
    required this.icon,
  });
}