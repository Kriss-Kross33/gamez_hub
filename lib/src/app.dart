import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/themes/app_theme.dart';

import 'core/gamez_hub_app/gamez_hub_app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.defaultTheme,
      home: GamezHubApp(),
    );
  }
}
