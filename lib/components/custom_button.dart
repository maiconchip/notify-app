import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onTap;
  const CustomButton({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: FadedScaleAnimation(
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: theme.primaryColor),
          child: Text(
            text!,
            style: theme.textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
