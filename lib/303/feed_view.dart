import 'package:flutter/material.dart';
import 'package:flutter_exercises/202/service/post_model.dart';
import 'package:flutter_exercises/202/service/post_service.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<PostModel>?> _itemFuture;

  @override
  void initState() {
    super.initState();
    _itemFuture = PostService().callPostApi();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {});
        }),
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))],
        ),
        body: _FeedFutureBuilder(itemFuture: _itemFuture));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _FeedFutureBuilder extends StatelessWidget {
  const _FeedFutureBuilder({
    super.key,
    required Future<List<PostModel>?> itemFuture,
  }) : _itemFuture = itemFuture;

  final Future<List<PostModel>?> _itemFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
        future: _itemFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Placeholder();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data?[index].body ?? ""),
                        ),
                      );
                    });
              } else {
                return Placeholder();
              }
          }
        });
  }
}
