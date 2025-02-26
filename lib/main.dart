import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercises/101/column_row_learn.dart';
import 'package:flutter_exercises/101/custom_widget_learn.dart';
import 'package:flutter_exercises/101/indicator_learn.dart';
import 'package:flutter_exercises/101/list_tile_learn.dart';
import 'package:flutter_exercises/101/list_view_builder.dart';
import 'package:flutter_exercises/101/list_view_learn.dart';
import 'package:flutter_exercises/101/navigation_learn.dart';
import 'package:flutter_exercises/101/page_view_learn.dart';
import 'package:flutter_exercises/101/stack_learn.dart';
import 'package:flutter_exercises/101/statefull_learn.dart';
import 'package:flutter_exercises/101/statefull_life_cycle_learn.dart';
import 'package:flutter_exercises/101/text_field_learn.dart';
import 'package:flutter_exercises/202/model_learn_view.dart';
import 'package:flutter_exercises/202/package_learn_view.dart';
import 'package:flutter_exercises/202/service/service_learn_view.dart';
import 'package:flutter_exercises/202/tab_learn.dart';
import 'package:flutter_exercises/202/theme/light_theme.dart';
import 'package:flutter_exercises/202/theme_learn_view.dart';
import 'package:flutter_exercises/demos/color_demos_view.dart';
import 'package:flutter_exercises/demos/color_life_cycle.dart';
import 'package:flutter_exercises/demos/gpt_note_demos_view.dart';
import 'package:flutter_exercises/101/image_learn.dart';
import 'package:flutter_exercises/demos/note_demos_view.dart';
import 'package:flutter_exercises/demos/note_demos_with_video.dart';
import 'package:flutter_exercises/101/color_learn.dart';
import 'package:flutter_exercises/101/stateless_learn.dart';
import 'package:flutter_exercises/101/app_bar_view.dart';
import 'package:flutter_exercises/101/icon_learn.dart';
import 'package:flutter_exercises/101/button_learn.dart';
import 'package:flutter_exercises/101/container_sized_box_learn.dart';
import 'package:flutter_exercises/101/scaffold_learn.dart';
import 'package:flutter_exercises/101/text_learn_view.dart';
import 'package:flutter_exercises/101/card_learn.dart';
import 'package:flutter_exercises/101/padding_learn.dart';
import 'package:flutter_exercises/demos/stack_demo_view.dart';
import 'package:flutter_exercises/screen_ui/login_screen.dart';
import 'package:flutter_exercises/screen_ui/weight_app_screen.dart';
import 'demos/my_collections_demos.dart';
import 'screen_ui/LogInAndSignInScreens/login_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,


      /*
      theme: ThemeData.dark().copyWith(

        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label,
        ),
          bottomAppBarTheme: BottomAppBarTheme(
            shape: CircularNotchedRectangle()
          ),

          listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
          inputDecorationTheme: InputDecorationTheme(
            iconColor: Colors.red,
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: Colors.white),
          cardTheme: CardTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light)),
       */

      home: LoginScreen2(),
    );
  }
}
