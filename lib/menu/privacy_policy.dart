import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.getTranslationOf('privacy_policy')!,
          style: theme.textTheme.subtitle1,
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          padding: EdgeInsets.all(24),
          children: [
            FadedScaleAnimation(
              Image.asset(
                'assets/logo.png',
                height: 200,
                scale: 2.5,
              ),
            ),
            Text(
              '\n' + context.getTranslationOf('privacy_policy')! + '\n',
              style: theme.textTheme.headline6!.copyWith(
                color: theme.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: theme.textTheme.caption!.copyWith(
                color: blackTextColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.easeInCubic,
      ),
    );
  }
}
