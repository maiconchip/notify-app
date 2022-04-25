import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ContactDetails {
  final String image;
  final String name;
  final String? subtitle;
  final IconData icon;

  ContactDetails(
    this.image,
    this.name,
    this.subtitle,
    this.icon,
  );
}

class NewChat extends StatelessWidget {
  const NewChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<ContactDetails> _contactDetails = [
      ContactDetails(
        "assets/profile_images/Layer 997.png",
        "Emili Johnson",
        context.getTranslationOf('working_out'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 998.png",
        "Angela Dove",
        context.getTranslationOf('travelling_to_hometown'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 999.png",
        "Kelly Smith",
        context.getTranslationOf('busy_message_only'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 1000.png",
        "David Accountant",
        context.getTranslationOf('believe_in_yourself'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 1001.png",
        "Tony Rey",
        context.getTranslationOf('netflix_lover'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 1002.png",
        "George Client",
        context.getTranslationOf('busy_message_only'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 1004.png",
        "Tony Rey",
        context.getTranslationOf('no_issues'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 1005.png",
        "Angela Dove",
        context.getTranslationOf('netflix_lover'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 997.png",
        "Emili Johnson",
        context.getTranslationOf('working_out'),
        Icons.chat_outlined,
      ),
      ContactDetails(
        "assets/profile_images/Layer 998.png",
        "Angela Dove",
        context.getTranslationOf('travelling_to_hometown'),
        Icons.chat_outlined,
      ),
    ];
    return Scaffold(
      backgroundColor: entryFieldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          context.getTranslationOf('select_contact')!,
          style: theme.textTheme.headline6,
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: FadedSlideAnimation(
        ListView.builder(
            padding: EdgeInsets.only(top: 8),
            shrinkWrap: true,
            itemCount: _contactDetails.length,
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
                  leading: Image.asset(_contactDetails[index].image),
                  title: Row(
                    children: [
                      Text(
                        _contactDetails[index].name,
                        style: theme.textTheme.bodyText1,
                      ),
                      Spacer(),
                      Icon(
                        _contactDetails[index].icon,
                        color: theme.primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    '  ' + _contactDetails[index].subtitle!,
                    style: theme.textTheme.subtitle2!.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ),
              );
            }),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.easeInCubic,
      ),
    );
  }
}
