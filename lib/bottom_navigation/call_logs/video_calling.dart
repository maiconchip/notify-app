import 'package:flutter/material.dart';
import 'package:notify/components/calling_component.dart';
import 'package:notify/locale/locales.dart';

class VideoCalling extends StatelessWidget {
  const VideoCalling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallingComponent(
        backgroundImage: "assets/caller imager.png",
        callingIcon: Icons.call_end,
        text1: "notify " + context.getTranslationOf('video_calling')!,
        text2: context.getTranslationOf('video_calling'),
        icon1: Icons.flip_camera_ios,
        callingIconColor: Colors.red,
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
