import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {

  static const paraf = "/";

  final items = {
    paraf: (context) => const LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetailView(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesextension on NavigateRoutes {
  String get withParaf => "/$name";
}
