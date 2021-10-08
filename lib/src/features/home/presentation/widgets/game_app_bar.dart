import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamez_hub/src/core/constants/app_color.dart';

class GameAppBar extends StatelessWidget {
  final Widget? rightIcon;
  const GameAppBar({Key? key, this.rightIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: SvgPicture.asset(
                  'assets/images/svg/menu.svg',
                  height: 18,
                  width: 18,
                  color: AppColor.iconColor,
                ),
              ),
              Container(
                child: rightIcon ?? SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
