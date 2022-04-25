import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/contacts.dart';
import 'package:notify/components/line_container.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ChannelProfile extends StatefulWidget {
  const ChannelProfile({Key? key}) : super(key: key);

  @override
  _ChannelProfileState createState() => _ChannelProfileState();
}

class _ChannelProfileState extends State<ChannelProfile> {
  bool muteNotification = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/group pic.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  PositionedDirectional(
                      start: 12,
                      top: 30,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: theme.scaffoldBackgroundColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    title: Text(
                      'St. Merry School',
                      style: theme.textTheme.subtitle1!.copyWith(
                        color: blackTextColor,
                      ),
                    ),
                    subtitle: Text(
                        context.getTranslationOf('old_school_friends_group')!,
                        style: theme.textTheme.subtitle2),
                  ),
                  LineContainer(),
                  SwitchListTile(
                    activeColor: theme.primaryColor,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    value: muteNotification,
                    onChanged: (value) {
                      setState(() {
                        muteNotification = value;
                      });
                    },
                    title: Text(
                      context.getTranslationOf('mute_notifications')!,
                      style: theme.textTheme.subtitle2,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(context.getTranslationOf('members')! + ' (10)',
                                style: theme.textTheme.subtitle2),
                            Spacer(),
                            Icon(
                              Icons.add,
                              color: theme.primaryColor,
                              size: 16,
                            ),
                            Text(
                              context.getTranslationOf('add_more')!,
                              style: theme.textTheme.subtitle2!.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ContactComponent(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        icon: Icons.remove_circle_outline,
                        iconColor: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.mediaAudioDocs);
            },
            child: FadedScaleAnimation(
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                color: theme.primaryColor,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      context.getTranslationOf('media')!,
                      style: theme.textTheme.subtitle1,
                    ),
                    Text(
                      context.getTranslationOf('audio')!,
                      style: theme.textTheme.subtitle1!
                          .copyWith(color: darkPrimaryTextColor),
                    ),
                    Text(
                      context.getTranslationOf('docs')!,
                      style: theme.textTheme.subtitle1!
                          .copyWith(color: darkPrimaryTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
