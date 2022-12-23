import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String headerText;
  const SectionHeader({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          headerText,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          width: 100,
          height: 6,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(3),
          ),
        )
      ],
    );
  }
}
