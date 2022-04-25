import 'package:flutter/material.dart';
import 'package:notify/auth/sign_in/sign_in.dart';
import 'package:notify/auth/verification/verification.dart';
import 'package:notify/bottom_navigation/bottom_navigation.dart';
import 'package:notify/bottom_navigation/call_logs/incoming_voice_call.dart';
import 'package:notify/bottom_navigation/call_logs/video_calling.dart';
import 'package:notify/bottom_navigation/call_logs/voice_calling_picked_up.dart';
import 'package:notify/bottom_navigation/chats/chat_profile.dart';
import 'package:notify/bottom_navigation/chats/media_audio_docs.dart';
import 'package:notify/bottom_navigation/groups/add_group_info.dart';
import 'package:notify/bottom_navigation/groups/create_group.dart';
import 'package:notify/bottom_navigation/groups/group_chat.dart';
import 'package:notify/bottom_navigation/groups/group_profile.dart';
import 'package:notify/bottom_navigation/new_chat/chatting.dart';
import 'package:notify/bottom_navigation/new_chat/new_chat.dart';
import 'package:notify/menu/language_ui.dart';
import 'package:notify/menu/privacy_policy.dart';
import 'package:notify/menu/profile.dart';

class PageRoutes {
  static const String signIn = "signIn";
  static const String verification = "verification";
  static const String bottomNavigation = "bottomNavigation";
  static const String newChat = "newChat";
  static const String chatting = "chatting";
  static const String chatProfile = "chatProfile";
  static const String mediaAudioDocs = "mediaAudioDocs";
  static const String profile = "profile";
  static const String privacyPolicy = "privacyPolicy";
  static const String changeLanguage = "changeLanguage";
  static const String incomingVoiceCalling = "incomingVoiceCalling";
  static const String voiceCallingPickedUp = "voiceCallingPickedUp";
  static const String videoCalling = "videoCalling";
  static const String channelChat = "channelChat";
  static const String channelProfile = "channelProfile";
  static const String addGroupInfo = "addGroupInfo";
  static const String createGroup = "createGroup";

  Map<String, WidgetBuilder> routes() {
    return {
      signIn: (context) => SignIn(),
      verification: (context) => Verification(),
      bottomNavigation: (context) => AppNavigation(),
      newChat: (context) => NewChat(),
      chatting: (context) => Chatting(),
      chatProfile: (context) => ChatProfile(),
      mediaAudioDocs: (context) => MediaAudioDocs(),
      profile: (context) => Profile(),
      privacyPolicy: (context) => PrivacyPolicy(),
      changeLanguage: (context) => LanguageUI(),
      incomingVoiceCalling: (context) => IncomingVoiceCall(),
      voiceCallingPickedUp: (context) => VoiceCallingPickedUp(),
      videoCalling: (context) => VideoCalling(),
      channelChat: (context) => ChannelChat(),
      channelProfile: (context) => ChannelProfile(),
      addGroupInfo: (context) => AddGroupInfo(),
      createGroup: (context) => CreateGroup(),
    };
  }
}
