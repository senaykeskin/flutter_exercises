import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_exercises/202/service/post_model.dart';
import 'package:http/http.dart' as http;

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({super.key});

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  int? counter;
  var _resultData;

  Future<List<PostModel>?> callPostApi() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == HttpStatus.ok) {
        var result = modelFromJson(response.body);

        if (mounted) {
          setState(() {
            counter = result.length;
            _resultData = result;
          });
          return result;
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;

  }

  @override
  void initState() {
    super.initState();
    callPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(Icons.refresh),
          onPressed: () {
            callPostApi();
          }),
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: counter == null
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: counter,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_resultData[index].id.toString()),
                      subtitle: Text(_resultData[index].title),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
