import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class MediaOptions {
  final IconData icon;
  final String? name;

  MediaOptions(this.icon, this.name);
}

class Chatting extends StatefulWidget {
  const Chatting({Key? key}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  TextEditingController _controller = new TextEditingController();
  bool showMediaOptions = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<MediaOptions> _mediaOptions = [
      MediaOptions(Icons.camera_alt_sharp, getTranslationOf('camera')),
      MediaOptions(Icons.image, getTranslationOf('gallery')),
      MediaOptions(Icons.contacts_outlined, getTranslationOf('contact')),
      MediaOptions(Icons.headset_mic_sharp, getTranslationOf('audio')),
      MediaOptions(Icons.location_on, getTranslationOf('location')),
      MediaOptions(Icons.event_note_sharp, getTranslationOf('document')),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: ListTile(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.chatProfile);
          },
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          leading: Image.asset(
            "assets/profile_images/Layer 997.png",
            width: 50,
            height: 50,
          ),
          title: Text('Emili Johnson'),
          subtitle: Text(
            getTranslationOf('online')!,
            style: theme.textTheme.caption!.copyWith(
              color: theme.scaffoldBackgroundColor.withOpacity(0.6),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 8,
          ),
          Icon(Icons.call),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.videocam),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Container(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical -
                    70,
                child: MessageStream()),
            TextField(
              controller: _controller,
              onTap: () {
                setState(() {
                  _controller.clear();
                  FocusScope.of(context).unfocus();
                });
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 15),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  hintText: getTranslationOf('type_your_message'),
                  hintStyle: theme.textTheme.subtitle2!.copyWith(fontSize: 12),
                  fillColor: Color(0xfff8f9fd),
                  prefixIcon: Icon(
                    Icons.emoji_emotions_outlined,
                    color: theme.hintColor,
                    size: 21,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      showMediaOptions == false
                          ? IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                size: 21,
                              ),
                              color: theme.hintColor,
                              onPressed: () {
                                setState(() {
                                  showMediaOptions = !showMediaOptions;
                                  _controller.clear();
                                  FocusScope.of(context).unfocus();
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.cancel_outlined,
                                size: 21,
                              ),
                              color: blackTextColor,
                              onPressed: () {
                                setState(() {
                                  showMediaOptions = !showMediaOptions;
                                  _controller.clear();
                                  FocusScope.of(context).unfocus();
                                });
                              },
                            ),
                      Icon(
                        Icons.mic,
                        color: theme.primaryColor,
                        size: 24,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )),
            ),
            showMediaOptions == true
                ? GridView.builder(
                    padding: EdgeInsets.only(bottom: 8),
                    shrinkWrap: true,
                    itemCount: _mediaOptions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.2, crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadedScaleAnimation(
                            Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: entryFieldBackgroundColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                _mediaOptions[index].icon,
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            _mediaOptions[index].name!,
                            style: theme.textTheme.caption!.copyWith(
                              color: blackTextColor,
                              fontSize: 10,
                            ),
                          )
                        ],
                      );
                    })
                : SizedBox.shrink(),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.easeInCubic,
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MessageBubble> messageBubbles = [
      MessageBubble(
        sender: 'user',
        text: context.getTranslationOf('hey_samantha'),
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: context.getTranslationOf('hey_whats_up'),
        time: '11:58 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'user',
        text: context.getTranslationOf('can_you_send_me'),
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: context.getTranslationOf('sure_just_a_sec'),
        time: '11:58 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'user',
        text: 'Rozzy Mathew',
        time: '11:59 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: context.getTranslationOf('thank_you'),
        time: '11:58 am',
        isDelivered: false,
        isMe: false,
      ),
    ];
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: messageBubbles,
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? sender;
  final String? time;
  final bool? isDelivered;

  MessageBubble(
      {this.sender, this.text, this.time, this.isMe, this.isDelivered});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color: isMe! ? theme.primaryColor : entryFieldBackgroundColor,
            borderRadius: BorderRadius.circular(6.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text!,
                    style: isMe!
                        ? Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.scaffoldBackgroundColor)
                        : Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      isMe!
                          ? Icon(
                              Icons.done_all,
                              color: isDelivered!
                                  ? Colors.blue
                                  : theme.scaffoldBackgroundColor,
                              size: 12.0,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
