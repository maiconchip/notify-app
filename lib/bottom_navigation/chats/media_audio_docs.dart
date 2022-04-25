import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify/components/audio_grid_view.dart';
import 'package:notify/components/doc_list_view.dart';
import 'package:notify/components/media_grid_view.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class MediaAudioDocs extends StatelessWidget {
  const MediaAudioDocs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Text(
              'Emili Johnson',
              style: theme.textTheme.headline6,
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.all(8),
              indicatorColor: theme.scaffoldBackgroundColor,
              labelStyle: theme.textTheme.subtitle1,
              labelColor: theme.scaffoldBackgroundColor,
              unselectedLabelColor: darkPrimaryTextColor,
              tabs: [
                Text(context.getTranslationOf('media')!),
                Text(context.getTranslationOf('audio')!),
                Text(context.getTranslationOf('docs')!),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FadedSlideAnimation(
                ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        context.getTranslationOf('recent')!.toUpperCase(),
                        style: theme.textTheme.subtitle1!.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    ),
                    MediaGridView(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        context.getTranslationOf('last_week')!.toUpperCase(),
                        style: theme.textTheme.subtitle1!.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    ),
                    MediaGridView(),
                  ],
                ),
                beginOffset: Offset(0.3, 0.3),
                endOffset: Offset(0, 0),
                curve: Curves.easeInCubic,
              ),
              FadedSlideAnimation(
                Container(
                  color: entryFieldBackgroundColor,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          context.getTranslationOf('recent')!.toUpperCase(),
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                      AudioGridView(
                        count: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          context.getTranslationOf('this_week')!.toUpperCase(),
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                      AudioGridView(
                        count: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          context.getTranslationOf('this_month')!.toUpperCase(),
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                      AudioGridView(
                        count: 8,
                      ),
                    ],
                  ),
                ),
                beginOffset: Offset(0.3, 0.3),
                endOffset: Offset(0, 0),
                curve: Curves.easeInCubic,
              ),
              FadedSlideAnimation(
                Container(
                  color: entryFieldBackgroundColor,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          context.getTranslationOf('recent')!.toUpperCase(),
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                      DocListView(count: 2),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          context.getTranslationOf('this_week')!.toUpperCase(),
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: theme.hintColor,
                          ),
                        ),
                      ),
                      DocListView(count: 3),
                    ],
                  ),
                ),
                beginOffset: Offset(0.3, 0.3),
                endOffset: Offset(0, 0),
                curve: Curves.easeInCubic,
              ),
            ],
          ),
        ));
  }
}
