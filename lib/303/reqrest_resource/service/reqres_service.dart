import 'dart:convert';
import 'dart:io';
import 'package:flutter_exercises/303/reqrest_resource/model/resource_model.dart';
import 'package:http/http.dart' as http;

abstract class IReqresService {
  IReqresService(this.baseUrl);

  final Uri baseUrl;

  Future<ResourceModel?> fetchResourceItem();
}

class ReqresService extends IReqresService {
  ReqresService(super.baseUrl);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await http.get(Uri.parse("$baseUrl/unknown"));

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.body);

      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}

