import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/gamez_hub_app/widgets/widget.dart';
import 'package:gamez_hub/src/features/home/presentation/widgets/widgets.dart';
import 'package:gamez_hub/src/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: ListView(
        children: [
          ResponsiveLayout(
            desktop: Container(),
            tablet: Container(),
            phone: PhoneBody(),
          ),
        ],
      ),
    );
  }
}
