import 'package:flutter/material.dart';
import 'package:flutter_exercises/product/navigator/navigator_manager.dart';

mixin NavigatorMixin<T extends StatefulWidget> on State<T> {
  NavigatorManagersss get router => NavigatorManagersss.instance;
}