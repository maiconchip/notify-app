import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/components/custom_button.dart';
import 'package:notify/config/app_config.dart';
import 'package:notify/language_cubit.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/locale/locales.dart';

class LanguageUI extends StatefulWidget {
  @override
  _LanguageUIState createState() => _LanguageUIState();
}

class _LanguageUIState extends State<LanguageUI> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        centerTitle: true,
        title: Text(
          getTranslationOf('select_language')!,
          style: theme.textTheme.headline6!.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<LanguageCubit, Locale>(
            builder: (context, state) {
              return Container(
                  height: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.vertical,
                  child: FadedSlideAnimation(
                    ListView(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 16),
                          itemCount: AppConfig.languagesSupported.length,
                          itemBuilder: (context, index) => RadioListTile(
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (dynamic value) {
                              print(value);
                              BlocProvider.of<LanguageCubit>(context)
                                  .setCurrentLanguage(value as String);
                            },
                            groupValue: state.languageCode,
                            value: AppConfig.languagesSupported.keys
                                .elementAt(index),
                            title: Text(
                                AppConfig
                                    .languagesSupported[AppConfig
                                        .languagesSupported.keys
                                        .elementAt(index)]!
                                    .name,
                                style: theme.textTheme.bodyText1),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    beginOffset: Offset(0, 0.3),
                    endOffset: Offset(0, 0),
                    curve: Curves.linearToEaseOut,
                  ));
            },
          ),
          PositionedDirectional(
            bottom: 16,
            start: 0,
            end: 0,
            child: CustomButton(
              text: getTranslationOf('update_language'),
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.signIn);
              },
            ),
          ),
        ],
      ),
    );

  }
}
