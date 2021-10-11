import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/constants/text_consts.dart';

import '../widgets.dart';

class LiveStreamSection extends StatelessWidget {
  const LiveStreamSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionHeader(
            headerText: TextConst.liveStreamText,
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
