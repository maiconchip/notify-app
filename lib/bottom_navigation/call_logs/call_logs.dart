import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';

class CallDetails {
  final String image;
  final String name;
  final String subtitle;
  final IconData icon;
  final IconData callStatusIcon;
  final Color color;

  CallDetails(this.image, this.name, this.subtitle, this.icon,
      this.callStatusIcon, this.color);
}

class CallLogs extends StatelessWidget {
  const CallLogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<CallDetails> _callDetails = [
      CallDetails(
        "assets/profile_images/Layer 997.png",
        "Emili Johnson",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_made,
        Color(0xff41D243),
      ),
      CallDetails(
        "assets/profile_images/Layer 998.png",
        "Angela Dove",
        "June 23, 02:55 pm",
        Icons.videocam,
        Icons.call_made,
        Color(0xff41D243),
      ),
      CallDetails(
        "assets/profile_images/Layer 999.png",
        "Kelly Smith",
        "June 23, 02:55 pm",
        Icons.videocam,
        Icons.call_received,
        Color(0xff93D8F4),
      ),
      CallDetails(
        "assets/profile_images/Layer 1000.png",
        "David Accountant",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_missed,
        Colors.red,
      ),
      CallDetails(
        "assets/profile_images/Layer 1001.png",
        "Tony Rey",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_made,
        Color(0xff41D243),
      ),
      CallDetails(
        "assets/profile_images/Layer 1002.png",
        "George Client",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_received,
        Color(0xff93D8F4),
      ),
      CallDetails(
        "assets/profile_images/Layer 1004.png",
        "Tony Rey",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_missed,
        Colors.red,
      ),
      CallDetails(
        "assets/profile_images/Layer 1005.png",
        "Angela Dove",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_received,
        Color(0xff93D8F4),
      ),
      CallDetails(
        "assets/profile_images/Layer 1006.png",
        "Kelly Smith",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_made,
        Color(0xff41D243),
      ),
      CallDetails(
        "assets/profile_images/Layer 1007.png",
        "Emili Johnson",
        "June 23, 02:55 pm",
        Icons.call,
        Icons.call_made,
        Color(0xff41D243),
      )
    ];
    return Scaffold(
        backgroundColor: entryFieldBackgroundColor,
        body: FadedSlideAnimation(
          ListView.builder(
              padding: EdgeInsets.only(top: 8),
              shrinkWrap: true,
              itemCount: _callDetails.length,
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
                    onTap: index == 1 || index == 2
                        ? () {
                            Navigator.pushNamed(
                                context, PageRoutes.videoCalling);
                          }
                        : () {
                            Navigator.pushNamed(
                                context, PageRoutes.incomingVoiceCalling);
                          },
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 40,
                    leading: Image.asset(_callDetails[index].image),
                    title: Row(
                      children: [
                        Text(
                          _callDetails[index].name,
                          style: theme.textTheme.bodyText1,
                        ),
                        Spacer(),
                        Icon(
                          _callDetails[index].icon,
                          color: theme.primaryColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          _callDetails[index].callStatusIcon,
                          color: _callDetails[index].color,
                          size: 18,
                        ),
                        Text(
                          '  ' + _callDetails[index].subtitle,
                          style: theme.textTheme.subtitle2!.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
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
