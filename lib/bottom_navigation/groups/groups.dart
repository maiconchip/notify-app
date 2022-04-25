import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class ChannelsChatDetails {
  final String image;
  final String? name;
  final String? subtitle;
  final String time;
  final int status;

  ChannelsChatDetails(this.image, this.name, this.subtitle, this.time, this.status);
}

class Channels extends StatefulWidget {
  const Channels({Key? key}) : super(key: key);

  @override
  _ChannelsState createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<ChannelsChatDetails> _channelsChatDetails = [
      ChannelsChatDetails(
        "assets/profile_images/Layer 1005.png",
        context.getTranslationOf('opus_office_staff'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        0,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1006.png",
        context.getTranslationOf('gym_friends'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        1,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1007.png",
        context.getTranslationOf('family_and_friends'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        0,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1002.png",
        "St Marry School",
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        0,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1004.png",
        context.getTranslationOf('wall_street_woolf'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        0,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1002.png",
        context.getTranslationOf('motivators'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        1,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1005.png",
        context.getTranslationOf('opus_office_staff'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        0,
      ),
      ChannelsChatDetails(
        "assets/profile_images/Layer 1006.png",
        context.getTranslationOf('gym_friends'),
        context.getTranslationOf('oh_so_quick'),
        '08:11 am',
        0,
      ),
    ];
    return Scaffold(

        backgroundColor: entryFieldBackgroundColor,
        body: Builder(builder: (BuildContext context) {
          if (!_loadingAnchoredBanner) {
            _loadingAnchoredBanner = true;
            _createAnchoredBanner(context);
          }
          return ListView(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 25,
                child: Row(
                  children: [
                Text(
                "Channels",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline6,
                )]),
              ),
              FadedSlideAnimation(
                ListView.builder(
                    padding: EdgeInsets.only(top: 8),
                    shrinkWrap: true,
                    itemCount: _channelsChatDetails.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.channelChat);
                          },
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 40,
                          leading: Image.asset(_channelsChatDetails[index].image),
                          title: Row(
                            children: [
                              Text(
                                _channelsChatDetails[index].name!,
                                style: theme.textTheme.bodyText1,
                              ),
                              Spacer(),
                              TextButton(onPressed: (){}, child: Text(_channelsChatDetails[index].status==0?"Suscribe":"Unsuscribe"),
                                style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: _channelsChatDetails[index].status==0?Colors.green:Colors.red,
                                onSurface: Colors.grey,
                              ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            _channelsChatDetails[index].subtitle!,
                            style: theme.textTheme.subtitle2!.copyWith(
                              fontSize: 10,
                            ),
                          ),

                        ),
                      );
                    }),
                beginOffset: Offset(0, 0.2),
                durationInMilliseconds: 300,
                endOffset: Offset(0, 0),
                curve: Curves.linearToEaseOut,
              ),
            ],
          );
        }));
  }
}
