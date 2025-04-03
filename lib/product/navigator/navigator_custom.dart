import 'package:flutter/material.dart';
import 'package:flutter_exercises/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_exercises/303/navigator/navigate_home_view.dart';
import 'package:flutter_exercises/product/navigator/navigator_routes.dart';
import 'package:flutter_exercises/screen_ui/weather/weather_home_screen.dart';
import '../../303/lottie_learn.dart';

mixin NavigatorCustom on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const WeatherHomeScreen());
    }

    final _routes = routeSettings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (_routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const WeatherHomeScreen());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigateHomeView());
      case NavigateRoutes.detail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetailView(
              id: _id is String ? _id : null,
            ),
            isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullScreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
