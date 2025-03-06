import 'dart:io';
import 'package:flutter_exercises/202/service/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  Future<List<PostModel>?> callPostApi() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == HttpStatus.ok) {
        return modelFromJson(response.body);
      } else {
        print("Hata kodu: ${response.statusCode}");
      }
    } catch (e) {
      print("Hata: $e");
    }
    return null;
  }
}
