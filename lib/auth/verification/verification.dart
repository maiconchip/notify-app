import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/custom_button.dart';
import 'package:notify/components/verification_entry_field.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                Text(
                  '40 ' + context.getTranslationOf('seconds_left')!,
                  style: theme.textTheme.subtitle2!.copyWith(
                    color: darkHintColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Text(
              '\n' + context.getTranslationOf('verification_code')!,
              style: theme.textTheme.headline6!.copyWith(
                color: blackTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '\n' +
                  context.getTranslationOf('please_type')! +
                  ' +919876543210' +
                  '\n',
              style: theme.textTheme.subtitle2!.copyWith(
                color: darkHintColor,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                VerificationEntryField(
                  initialValue: '5',
                ),
                SizedBox(
                  width: 8,
                ),
                VerificationEntryField(
                  initialValue: '8',
                ),
                SizedBox(
                  width: 8,
                ),
                VerificationEntryField(
                  initialValue: '8',
                ),
                SizedBox(
                  width: 8,
                ),
                VerificationEntryField(
                  initialValue: '7',
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 44,
            ),
            CustomButton(
              text: context.getTranslationOf('confirm'),
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.bottomNavigation);
              },
            ),
            SizedBox(
              height: 16,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: context.getTranslationOf('did_receive_code')! + '  ',
                    style: theme.textTheme.caption,
                    children: [
                      TextSpan(
                          text: context
                              .getTranslationOf('resend_now')!
                              .toUpperCase(),
                          style: theme.textTheme.caption!.copyWith(
                            color: darkHintColor,
                            fontWeight: FontWeight.bold,
                          ))
                    ]))
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.linearToEaseOut,
      ),
    );
  }
}
