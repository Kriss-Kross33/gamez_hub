import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/constants/app_color.dart';
import 'package:gamez_hub/src/features/home/presentation/pages/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColor.lightGrey,
      ),
      home: HomeScreen(),
    );
  }
}
