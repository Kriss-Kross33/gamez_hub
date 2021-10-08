import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget phone;
  final Widget tablet;

  final Widget desktop;
  const ResponsiveLayout({
    Key? key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static final int phoneLimit = 650;
  // static final int smallTabletLimit = 800;
  static final int tabletLimit = 1110;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit;

  // static bool isSmallTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= phoneLimit &&
  //     MediaQuery.of(context).size.width < smallTabletLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= phoneLimit &&
      MediaQuery.of(context).size.width < tabletLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.height >= tabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= tabletLimit) {
          return desktop;
        } else if (constraints.maxWidth >= phoneLimit) {
          return tablet;
        }
        return phone;
      },
    );
  }
}
