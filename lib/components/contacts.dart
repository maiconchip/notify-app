import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/locale/locales.dart';

class Contacts {
  final String image;
  final String title;
  final String? subtitle;

  Contacts(this.image, this.title, this.subtitle);
}

class ContactComponent extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const ContactComponent(
      {Key? key, this.icon, this.iconColor, this.margin, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Contacts> _contacts = [
      Contacts("assets/profile_images/Layer 997.png", "Abby Smith",
          context.getTranslationOf('working_out')),
      Contacts("assets/profile_images/Layer 998.png", "Abdy Kane",
          context.getTranslationOf('travelling_to_hometown')),
      Contacts("assets/profile_images/Layer 1000.png", "Chintu Johnson",
          context.getTranslationOf('busy_message_only')),
      Contacts("assets/profile_images/Layer 1001.png", "Denny Denny",
          context.getTranslationOf('believe_in_yourself')),
      Contacts("assets/profile_images/Layer 1002.png", "Abby Smith",
          context.getTranslationOf('netflix_lover')),
      Contacts("assets/profile_images/Layer 1004.png", "Aana Aana",
          context.getTranslationOf('working_out')),
      Contacts("assets/profile_images/Layer 1005.png", "Abby Smith",
          context.getTranslationOf('busy')),
    ];
    return FadedSlideAnimation(
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: padding ?? EdgeInsets.all(8),
              margin:
                  margin ?? EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Image.asset(_contacts[index].image),
                title: Text(
                  _contacts[index].title,
                  style: theme.textTheme.bodyText1,
                ),
                subtitle: Text(
                  _contacts[index].subtitle!,
                  style: theme.textTheme.caption,
                ),
                trailing: Icon(
                  icon,
                  color: iconColor,
                  size: 20,
                ),
              ),
            );
          }),
      beginOffset: Offset(0.3, 0.3),
      endOffset: Offset(0, 0),
      curve: Curves.linearToEaseOut,
    );
  }
}
