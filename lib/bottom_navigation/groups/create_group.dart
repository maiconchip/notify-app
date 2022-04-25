import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/contacts.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class Members {
  final String image;
  final String name;

  Members(this.image, this.name);
}

class CreateGroup extends StatelessWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Members> _members = [
      Members("assets/profile_images/Layer 997.png", "Abby Smith"),
      Members("assets/profile_images/Layer 998.png", "Abdy Kane"),
      Members("assets/profile_images/Layer 999.png", "Chintu Johnson"),
      Members("assets/profile_images/Layer 1000.png", "Abby Smith"),
      Members("assets/profile_images/Layer 1001.png", "Denny Denny"),
      Members("assets/profile_images/Layer 1002.png", "Anny Shah"),
      Members("assets/profile_images/Layer 1004.png", "Aana Aana"),
      Members("assets/profile_images/Layer 1005.png", "Abby Smith"),
    ];

    return Scaffold(
      backgroundColor: entryFieldBackgroundColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.getTranslationOf('select_members')!,
              style: theme.textTheme.headline6!.copyWith(fontSize: 17),
            ),
            Text(
              '10 ' + context.getTranslationOf('selected')!,
              style: theme.textTheme.caption!.copyWith(
                  color: theme.scaffoldBackgroundColor.withOpacity(0.6)),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.search),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 8),
            color: theme.primaryColor,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _members.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset(
                          _members[index].image,
                          scale: 2.6,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          _members[index].name,
                          style: theme.textTheme.caption!.copyWith(
                              color: theme.scaffoldBackgroundColor,
                              fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  context.getTranslationOf('tap_on_contact')!,
                  style: theme.textTheme.subtitle2!.copyWith(
                    color: blackTextColor,
                  ),
                ),
              ),
              ContactComponent(
                icon: Icons.check_circle,
                iconColor: theme.primaryColor,
              ),
            ],
          ),
          PositionedDirectional(
            bottom: 130,
            end: 22,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.addGroupInfo);
              },
              child: FadedScaleAnimation(
                CircleAvatar(
                  radius: 30,
                  backgroundColor: theme.primaryColor,
                  child: Icon(
                    Icons.arrow_forward,
                    color: theme.scaffoldBackgroundColor,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
