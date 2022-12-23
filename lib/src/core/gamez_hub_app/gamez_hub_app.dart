import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/gamez_hub_app/widgets/widget.dart';
import 'package:gamez_hub/src/responsive_layout.dart';

class GamezHubApp extends StatelessWidget {
  const GamezHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      phone: PhoneHome(),
      tablet: TabletHome(),
      desktop: DesktopHome(),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '2',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

class Home3 extends StatelessWidget {
  const Home3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '3',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

class Home4 extends StatelessWidget {
  const Home4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '4',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
