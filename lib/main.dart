import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notify/locale/locales.dart';
import 'package:notify/menu/language_ui.dart';
import 'package:notify/routes/routes.dart';
import 'package:notify/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_cubit.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  MobileAds.instance.initialize();
  bool? isDark = prefs.getBool('theme');
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LanguageCubit()),
    BlocProvider(create: (context) => ThemeCubit(isDark)),
  ], child: Phoenix(child: MyApp())));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return BlocBuilder<LanguageCubit, Locale>(builder: (context, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('ar'),
              const Locale('pt'),
              const Locale('fr'),
              const Locale('id'),
              const Locale('es'),
              const Locale('it'),
              const Locale('tr'),
              const Locale('sw'),
            ],
            locale: locale,
            theme: theme,
            home: LanguageUI(),
            routes: PageRoutes().routes(),
          );
        });
      },
    );
  }
}
