import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gamez_hub/src/core/themes/app_theme.dart';

import 'core/constants/secure_storage_consts.dart';
import 'core/gamez_hub_app/gamez_hub_app.dart';
import 'core/service_locator/service_locator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    clearGameCache();
  }

  Future<void> clearGameCache() async {
    FlutterSecureStorage secureStorage = locator<FlutterSecureStorage>();
    await secureStorage.delete(key: SecureStorage.FETCH_GAMES_LIST);
  }

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
