import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          Divider(),
          SizedBox(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          // xx

          FittedBox(
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          Divider(),
          SizedBox(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          _ListDemo()
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({super.key});

  @override
  State<_ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print("welcome");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("exit");
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
