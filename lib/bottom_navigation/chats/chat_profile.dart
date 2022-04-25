import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/line_container.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ChatProfile extends StatefulWidget {
  const ChatProfile({Key? key}) : super(key: key);

  @override
  _ChatProfileState createState() => _ChatProfileState();
}

class _ChatProfileState extends State<ChatProfile> {
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
                    "assets/gallery_images/5.png",
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
              FadedSlideAnimation(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      title: Text(
                        'Emili Johnson',
                        style: theme.textTheme.subtitle1!.copyWith(
                          color: blackTextColor,
                        ),
                      ),
                      subtitle: Text(getTranslationOf('hey_notify_chat_is')!,
                          style: theme.textTheme.subtitle2),
                    ),
                    LineContainer(),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      title: Text(
                        getTranslationOf('phone_number')!,
                        style: theme.textTheme.subtitle2,
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '+1 987 654 3210',
                            style: theme.textTheme.subtitle1!.copyWith(
                              color: blackTextColor,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.call,
                            color: theme.primaryColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.videocam,
                            color: theme.primaryColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
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
                        getTranslationOf('mute_notifications')!,
                        style: theme.textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
                beginOffset: Offset(0.3, 0.3),
                endOffset: Offset(0, 0),
                curve: Curves.easeInCubic,
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
                      getTranslationOf('media')!,
                      style: theme.textTheme.subtitle1,
                    ),
                    Text(
                      getTranslationOf('audio')!,
                      style: theme.textTheme.subtitle1!
                          .copyWith(color: darkPrimaryTextColor),
                    ),
                    Text(
                      getTranslationOf('docs')!,
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
