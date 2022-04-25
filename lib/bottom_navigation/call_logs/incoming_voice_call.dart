import 'package:flutter/material.dart';
import 'package:notify/components/calling_component.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/locale/locales.dart';

class IncomingVoiceCall extends StatelessWidget {
  const IncomingVoiceCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallingComponent(
        backgroundImage: "assets/img2.png",
        callingIcon: Icons.call,
        text1: 'notify ' + context.getTranslationOf('voice_calling')!,
        text2: context.getTranslationOf('voice_calling'),
        icon1: Icons.volume_up,
        callingIconColor: Colors.green,
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.voiceCallingPickedUp);
        },
      ),
    );
  }
}
