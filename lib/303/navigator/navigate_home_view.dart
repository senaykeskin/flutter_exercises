import 'package:flutter/material.dart';
import 'package:flutter_exercises/product/mixin/navigator_mixin.dart';
import 'package:flutter_exercises/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView>
    with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          child: const Icon(Icons.abc_rounded),
          onPressed: () {
            router.pushToPage(NavigateRoutes.detail, arguments: "my app");
          }),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
