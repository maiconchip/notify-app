import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/contacts.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class AddGroupInfo extends StatelessWidget {
  const AddGroupInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.getTranslationOf('create_group')!,
          style: theme.textTheme.headline6!.copyWith(
            fontSize: 16,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.bottomNavigation);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Text(
                context.getTranslationOf('done')!.toUpperCase(),
                style: theme.textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: theme.primaryColor,
                  child: Icon(
                    Icons.camera_alt_sharp,
                    color: theme.scaffoldBackgroundColor,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: context.getTranslationOf('group_name'),
                        hintStyle: theme.textTheme.subtitle2,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.hintColor, width: 0.5))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: context.getTranslationOf('what_is_this_group'),
                  hintStyle: theme.textTheme.subtitle2,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: theme.hintColor, width: 0.5))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: entryFieldBackgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        context.getTranslationOf('group_members')! + ' (10)',
                        style: theme.textTheme.subtitle2!.copyWith(
                          color: blackTextColor,
                        ),
                      ),
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
                  icon: Icons.remove_circle_outline,
                  iconColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
