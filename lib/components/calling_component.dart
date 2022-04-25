import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class CallingComponent extends StatelessWidget {
  final String? backgroundImage;
  final String? text1;
  final String? text2;
  final Color? callingIconColor;
  final IconData? callingIcon;
  final IconData? icon1;
  final Function? onTap;
  const CallingComponent(
      {Key? key,
      this.backgroundImage,
      this.text1,
      this.text2,
      this.callingIconColor,
      this.callingIcon,
      this.icon1,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        Image.asset(
          backgroundImage!,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset(
              'assets/icon.png',
              scale: 2.5,
            ),
            Spacer(),
            Text(
              text1!,
              style: theme.textTheme.caption!.copyWith(
                color: theme.scaffoldBackgroundColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 8,
            ),
            FadedScaleAnimation(
              Image.asset(
                'assets/profpic.png',
                scale: 3,
              ),
            ),
            Spacer(),
            Text(
              'Emili Johnson',
              style: theme.textTheme.headline6!.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text2!,
              style: theme.textTheme.bodyText1!.copyWith(
                color: theme.scaffoldBackgroundColor,
              ),
            ),
            Spacer(
              flex: 12,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: callingIconColor,
              child: IconButton(
                icon: Icon(
                  callingIcon,
                  size: 28,
                ),
                color: theme.scaffoldBackgroundColor,
                onPressed: onTap as void Function()?,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon1,
                  color: theme.scaffoldBackgroundColor,
                  size: 28,
                ),
                Icon(
                  Icons.message,
                  color: theme.scaffoldBackgroundColor,
                  size: 28,
                ),
                Icon(
                  Icons.mic_off,
                  color: theme.scaffoldBackgroundColor,
                  size: 28,
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
          ],
        )
      ],
    );
  }
}
