import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/custom_button.dart';
import 'package:notify/components/entry_field.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/locale/locales.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/logo.png',
              scale: 2.5,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              getTranslationOf('welcome_back')!,
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              getTranslationOf('sign_in_to')!,
              style: theme.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            EntryField(
              hintText: getTranslationOf('select_country'),
              suffixWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    getTranslationOf('USA')! + ' (+1)' + ' ',
                    style: theme.textTheme.subtitle2!
                        .copyWith(color: theme.primaryColor),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: theme.primaryColor,
                  )
                ],
              ),
            ),
            EntryField(
              hintText: getTranslationOf('enter_phone_number'),
            ),
            SizedBox(
              height: 16,
            ),
            CustomButton(
              text: getTranslationOf('confirm'),
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.verification);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              getTranslationOf('we_will_send')! +
                  '\n' +
                  getTranslationOf('standard_rates_may')!,
              style: theme.textTheme.caption,
              textAlign: TextAlign.center,
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.linearToEaseOut,
      ),
    );
  }
}
