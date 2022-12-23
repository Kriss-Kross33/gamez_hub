import 'package:flutter/material.dart';
import 'package:gamez_hub/src/responsive_layout.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  const SectionContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      phone: Container(
        height: 300,
        width: 400,
        child: child,
      ),
      tablet: Container(
        height: 300,
        width: 900,
        child: child,
      ),
      desktop: Container(
        height: 300,
        width: 400,
        child: child,
      ),
    );
  }
}
