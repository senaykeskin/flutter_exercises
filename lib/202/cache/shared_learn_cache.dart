import 'package:flutter/material.dart';
import 'package:flutter_exercises/202/cache/shared_manager.dart';
import 'package:flutter_exercises/202/cache/user_model.dart';

class SharedLearnCache extends StatefulWidget {
  const SharedLearnCache({super.key});

  @override
  State<SharedLearnCache> createState() => _SharedLearnCacheState();
}

class _SharedLearnCacheState extends LoadingStatefull<SharedLearnCache> {
  int _currentValue = 0;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
  }

  void _initialize() {
    _manager.init();
    getDefaultValue();
  }

  Future<void> getDefaultValue() async {
    onChangeValue(_manager.getString(SharedKeys.counter) ?? "0");
  }

  void onChangeValue(String value) {
    final value0 = int.tryParse(value);

    if (value0 != null) {
      setState(() {
        _currentValue = value0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          _loading()
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading() {
    return isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
        onPressed: (() async {
          changeLoading();
          await _manager.saveString(
              SharedKeys.counter, _currentValue.toString());
          changeLoading();
        }),
        child: Icon(Icons.save));
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
        onPressed: (() async {
          changeLoading();
          await _manager.removeItem(SharedKeys.counter);
          await getDefaultValue();
          changeLoading();
        }),
        child: Icon(Icons.remove));
  }
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User("vb", "10", "vb10.dev"),
      User("vb1", "101", "vb10.dev"),
      User("vb2", "102", "vb10.dev"),
    ];
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
