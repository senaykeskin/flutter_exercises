import 'package:flutter/cupertino.dart';
import 'package:flutter_exercises/product/navigator/navigator_routes.dart';

class NavigatorManagersss {
  NavigatorManagersss._();

  static NavigatorManagersss instance = NavigatorManagersss._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  void pushToPage(NavigateRoutes route, {Object? arguments}) {
    _navigatorGlobalKey.currentState
        ?.pushNamed(route.withParaf, arguments: arguments);
  }
}