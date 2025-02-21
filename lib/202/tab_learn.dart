import 'package:flutter/material.dart';
import 'package:flutter_exercises/101/icon_learn.dart';
import 'package:flutter_exercises/101/text_field_learn.dart';
import 'package:flutter_exercises/screen_ui/login_screen.dart';
import 'package:flutter_exercises/screen_ui/weight_app_screen.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;

  final double _notchedValue = 6;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(_MyTabViews.home.index);
            },
            backgroundColor: Colors.blue,
            shape: CircleBorder(),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            child: _myTabView(),
          ),
          appBar: AppBar(),
          body: _tabBarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
            onTap: (int index) {},
            padding: EdgeInsets.zero,
            controller: _tabController,
            tabs: _MyTabViews.values
                .map((e) => Tab(text: "${e.name}"))
                .toList(),
          );
  }

  TabBarView _tabBarView() {
    return TabBarView(
            physics: NeverScrollableScrollPhysics(),
            // PageView gibi geçişlere engel olur.
            controller: _tabController,
            children: [
              WeightAppScreen(),
              LoginScreen(),
              IconLearnView(),
              TextFieldLearn()
            ]);
  }
}

enum _MyTabViews {
  home,
  settings,
  favorite,
  profile,
}

extension _MyTabViewExtension on _MyTabViews {}
