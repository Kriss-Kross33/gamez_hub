import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/constants/text_consts.dart';

import '../widgets.dart';

class NewGamesSection extends StatelessWidget {
  const NewGamesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionHeader(
            headerText: TextConst.newGamesText,
          ),
          SizedBox(
            height: 20.0,
          ),
          NewGamesListWidget(),
        ],
      ),
    );
  }
}
