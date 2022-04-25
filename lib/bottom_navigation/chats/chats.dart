import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ChatDetails {
  final String image;
  final String name;
  final String? subtitle;
  final String time;

  ChatDetails(this.image, this.name, this.subtitle, this.time);
}

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<ChatDetails> _chatDetails = [
      ChatDetails(
        "assets/profile_images/Layer 997.png",
        "Emili Johnson",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 998.png",
        "Angela Dove",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 999.png",
        "Kelly Smith",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1000.png",
        "David Accountant",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1001.png",
        "Tony Rey",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1002.png",
        "George Client",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1004.png",
        "Tony Rey",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1005.png",
        "Angela Dove",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1006.png",
        "Kelly Smith",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      ),
      ChatDetails(
        "assets/profile_images/Layer 1007.png",
        "Emili Johnson",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
      )
    ];
    return Scaffold(
        backgroundColor: entryFieldBackgroundColor,
        body: FadedSlideAnimation(
          ListView.builder(
              padding: EdgeInsets.only(top: 8),
              shrinkWrap: true,
              itemCount: _chatDetails.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.chatting);
                    },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 40,
                    leading: Image.asset(_chatDetails[index].image),
                    title: Row(
                      children: [
                        Text(
                          _chatDetails[index].name,
                          style: theme.textTheme.bodyText1,
                        ),
                        Spacer(),
                        Text(
                          _chatDetails[index].time,
                          style: theme.textTheme.caption!.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      _chatDetails[index].subtitle!,
                      style: theme.textTheme.subtitle2!.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ),
                );
              }),
          beginOffset: Offset(0, 0.2),
          durationInMilliseconds: 300,
          endOffset: Offset(0, 0),
          curve: Curves.linearToEaseOut,
        ));
  }
}
