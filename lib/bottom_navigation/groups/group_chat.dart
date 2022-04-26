import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ChannelChat extends StatefulWidget {
  const ChannelChat({Key? key}) : super(key: key);

  @override
  _ChannelChatState createState() => _ChannelChatState();
}

class _ChannelChatState extends State<ChannelChat> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: ListTile(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.channelProfile);
          },
          contentPadding: EdgeInsets.symmetric(vertical: 4),
          leading: Image.asset(
            "assets/profile_images/Layer 1005.png",
            width: 44,
            height: 50,
          ),
          title: Text(
            'Crypto Channel',
            style: theme.textTheme.headline6,
          ),
        ),
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

            ButtonBar(
              alignment: MainAxisAlignment.center,
              overflowDirection: VerticalDirection.down,
              children: [
                PositionedDirectional(
                  end: 24,
                  bottom: 18,
                  child: FloatingActionButton(
                    onPressed: (){
                      Navigator.pushNamed(context, PageRoutes.chatting);
                      },
                    child: Icon(Icons.chat),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),

              Text('Chat with admin Channel')
            ],
            ),
          ],
        ),
        beginOffset: Offset(0.3, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.linearToEaseOut,
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
        text: context.getTranslationOf('hey_friends'),
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
      MessageBubble(
        sender: 'user',
        text: context.getTranslationOf('i_was')! +
            context.getTranslationOf('whats_your_view')!,
        time: '11:59 am',
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
                            color: theme.hintColor
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
