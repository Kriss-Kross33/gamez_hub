import 'package:flutter/material.dart';
import 'package:gamez_hub/src/responsive_layout.dart';

import 'widgets/phone/phone_home.dart';

class GamezHubApp extends StatelessWidget {
  const GamezHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      phone: PhoneHome(),
      tablet: Container(),
      desktop: Container(),
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
