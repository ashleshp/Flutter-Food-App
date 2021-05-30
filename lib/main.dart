import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_app_for_care_monitor/screen/cartscreen.dart';
import 'package:food_app_for_care_monitor/screen/mainscreen.dart';
import 'package:food_app_for_care_monitor/viewmodel/listViewModel.dart';
import 'package:food_app_for_care_monitor/widgets/menugrid.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> ListViewModel(),child: MainScreen(),),
        ],
        child:MainScreen() ,
      ),
    );
  }

}