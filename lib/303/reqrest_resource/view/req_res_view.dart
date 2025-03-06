import 'package:flutter/material.dart';
import 'package:flutter_exercises/202/image_learn_202.dart';
import 'package:flutter_exercises/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_exercises/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_exercises/303/reqrest_resource/viewModel/req_res_provider.dart';
import 'package:flutter_exercises/product/extensions/string_extension.dart';
import 'package:flutter_exercises/product/global/resource_context.dart';
import 'package:flutter_exercises/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';
import '../../../product/service/project_network_manager.dart';
import '../viewModel/req_res_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

//class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectHttpMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(Uri.parse(baseUrl))),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ThemeNotifier>().changeTheme();
          }),
          appBar: AppBar(
              actions: [IconButton(onPressed: () {
                context.read<ReqResProvider>().saveToLocale(
                    context.read<ResourceContext>());
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return ImageLearn202();
                }));
              }, icon: Icon(Icons.ac_unit))
              ],
              title: context
                  .watch<ReqResProvider>()
                  .isLoading
                  ? CircularProgressIndicator(color: Colors.red)
                  : null),
          body: Column(
            children: [
              _TempPlaceHolder(),
              Expanded(
                child: _resourceListview(
                    context, context
                    .watch<ReqResProvider>()
                    .resources),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ""),
          );
        });
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(
        builder: (context, value, child) {
          return value ? Placeholder() : Text("data");
        }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
