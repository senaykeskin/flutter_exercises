import 'package:flutter/material.dart';
import 'package:flutter_exercises/index.dart';
import 'package:flutter_exercises/product/constants/duration_items.dart';
import 'package:flutter_exercises/product/constants/lottie_items.dart';
import 'package:flutter_exercises/product/navigator/navigator_routes.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

// https://lottie.host/af0694b5-172b-4fc5-91c0-deb10ea7c3da/hHtmZTplAI.json

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(Duration(seconds: 30));
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            onTap: () async {
              await controller.animateTo(!isLight ? 0.5 : 1);
              isLight = !isLight;
              Future.microtask(() {
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
              width: 90,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });

  final _loadingLottie =
      'https://lottie.host/6d45c048-98e0-4824-be04-67203466fe8d/1YJSQwM99c.json';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loadingLottie),
    );
  }
}
