import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  late AnimationController controller;

  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),

      //body: Text("data", style: context.textTheme().bodyMedium,),

      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems.durationLow,
              opacity: _isOpacity ? 1 : 0,
              child: const Text("data"),
            ),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: Icon(Icons.precision_manufacturing_rounded)),
          ),
          AnimatedDefaultTextStyle(
              style: (_isVisible
                      ? context.textTheme().displayLarge
                      : context.textTheme().titleSmall) ??
                  TextStyle(),
              duration: _DurationItems.durationLow,
              child: Text("data")),
          AnimatedIcon(icon: AnimatedIcons.close_menu, progress: controller),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: MediaQuery.of(context).size.width * 0.2,
            width:
                _isVisible ? kZero : MediaQuery.of(context).size.height * 0.2,
            color: Colors.blue,
            margin: EdgeInsets.all(30),
          ),
          Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                  top: 30,
                  curve: Curves.elasticOut,
                  duration: _DurationItems.durationLow,
                  child: Text("data"))
            ],
          )),
          Expanded(
            child: AnimatedList(itemBuilder: (context, index, animation) {
              return Text("data");
            }),
          ),
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: Placeholder(),
        secondChild: SizedBox(),
        crossFadeState:
            _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow);
  }
}

extension BuildContextExt on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
