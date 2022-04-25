import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ProfileItems {
  final String? name;
  final IconData icon;

  ProfileItems(this.name, this.icon);
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<ProfileItems> _profileItems = [
      ProfileItems(context.getTranslationOf('share_app'), Icons.share),
      ProfileItems(context.getTranslationOf('rate_app'), Icons.thumb_up),
      ProfileItems(
          context.getTranslationOf('privacy_policy'), Icons.event_note),
      ProfileItems(context.getTranslationOf('change_language'), Icons.language),
      ProfileItems(context.getTranslationOf('contact_us'), Icons.mail),
      ProfileItems(
          context.getTranslationOf('log_out'), Icons.power_settings_new),
    ];
    return Scaffold(
      body: FadedSlideAnimation(
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  color: theme.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 34,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: theme.scaffoldBackgroundColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        context.getTranslationOf('you')!.padLeft(10),
                        style: theme.textTheme.subtitle2!.copyWith(
                          color: theme.scaffoldBackgroundColor,
                        ),
                      ),
                      Text(
                        '+1 987 654 3210'.padLeft(20),
                        style: theme.textTheme.headline6,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                    end: 24,
                    bottom: -24,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        FadedScaleAnimation(
                          Image.asset(
                            'assets/profilepic.png',
                            scale: 3,
                          ),
                        ),
                        PositionedDirectional(
                          end: -6,
                          top: 16,
                          child: Icon(
                            Icons.camera_alt_sharp,
                            color: theme.scaffoldBackgroundColor,
                            size: 20,
                          ),
                        )
                      ],
                    )),
              ],
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              title: Text(
                context.getTranslationOf('status')!,
                style: theme.textTheme.subtitle2,
              ),
              subtitle: Text(
                context.getTranslationOf('living_life_queen_size')!,
                style: theme.textTheme.subtitle1!.copyWith(
                  color: blackTextColor,
                ),
              ),
              trailing: Icon(
                Icons.edit,
                color: theme.primaryColor,
              ),
            ),
            Container(
              height: 4.0,
              color: entryFieldBackgroundColor,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _profileItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    leading: Icon(
                      _profileItems[index].icon,
                      color: theme.primaryColor,
                    ),
                    title: Text(
                      _profileItems[index].name!,
                      style: theme.textTheme.bodyText1,
                    ),
                    onTap: index == 2
                        ? () {
                            Navigator.pushNamed(
                                context, PageRoutes.privacyPolicy);
                          }
                        : index == 3
                            ? () {
                                Navigator.pushNamed(
                                    context, PageRoutes.changeLanguage);
                              }
                            : index == 5
                                ? () {
                                    Navigator.pushNamed(
                                        context, PageRoutes.signIn);
                                  }
                                : () {},
                  );
                })
          ],
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.linearToEaseOut,
      ),
    );
  }
}
