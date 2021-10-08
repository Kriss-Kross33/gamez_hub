import 'package:flutter/material.dart';
import 'package:gamez_hub/src/core/constants/app_color.dart';
import 'package:gamez_hub/src/core/constants/asset_consts.dart';

class ShowcaseInfoWidget extends StatelessWidget {
  final String title;
  const ShowcaseInfoWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 140,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.darkPrimaryColor.withOpacity(0.4),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetConst.stream,
                      color: AppColor.darkSecondaryColor,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Live',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Online Watching',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: AppColor.darkSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppColor.darkSecondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 44,
              width: 140,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColor.iconColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColor.lightPrimaryColor.withOpacity(0.9),
                        ),
                      ),
                    ),
                    Text(
                      'Watch',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: AppColor.lightPrimaryColor.withOpacity(0.9)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
