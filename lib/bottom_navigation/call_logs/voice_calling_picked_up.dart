import 'package:flutter/material.dart';
import 'package:notify/components/calling_component.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/locale/locales.dart';

class VoiceCallingPickedUp extends StatelessWidget {
  const VoiceCallingPickedUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallingComponent(
        backgroundImage: "assets/img2.png",
        callingIcon: Icons.call_end,
        text1: "notify " + context.getTranslationOf('voice_calling')!,
        text2: "00:35",
        icon1: Icons.volume_up,
        callingIconColor: Colors.red,
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.bottomNavigation);
        },
      ),
    );
  }
}
