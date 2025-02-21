import 'package:flutter/material.dart';
import 'package:flutter_exercises/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {

  var user9 = PostModel8(body: "a");

  @override
  void initState() {
    super.initState();

    /*
    final user1 = PostModel()
      ..userId = 1
      ..body = 'vb';
    user1.body = 'hello';

     */
    
    
    final user2 = PostModel2(userId: 1, id: 2, title: "a", body: "b");
    user2.body = "b";
    
    final user3 = PostModel3(1, 2, "a", "b");
    // user3.body = "cvbn";    =>   // {hata} / final olduğu için update yasak


    // IMPORTANT: local veriable için kullan //
    final user4 = PostModel4(userId: 1, id: 2, title: "aa", body: "bb");
    // user4.body = "ccc";    =>  // {hata} /  yine final

    final user5 = PostModel5(userId: 1, id: 2, title: "title", body: "body");
    user5.userId;  // class içinde 'get' oluşturarak aldık
    // normalde erişim yoktu
    
    final user6 = PostModel6(userId: 1, id: 2, title: "title", body: "body");

    final user7 = PostModel7();
    // burada default değerleri aldı.


    // IMPORTANT: servis istekleri için kullan //
    final user8 = PostModel8(body: "a", title: "2345678");
    // PostModel8() olarak kalabilir.

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(title: "vb");
          user9.updateBody("veli");
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? "Not has any data"),
      ),
    );
  }
}
