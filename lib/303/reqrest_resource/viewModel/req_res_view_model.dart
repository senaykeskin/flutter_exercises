import 'dart:developer';

import 'package:flutter_exercises/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_exercises/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_exercises/index.dart';
import 'package:flutter_exercises/product/service/project_network_manager.dart';
import '../view/req_res_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqResView>
    with ProjectHttpMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(Uri.parse(baseUrl));
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    final response = await reqresService.fetchResourceItem();
    resources = response?.data ?? [];
    changeLoading();
  }
}
