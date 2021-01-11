import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './config.dart';
import './pages/home.dart';
import 'services/theme_changer.dart';
import 'theme/theme.dart';


//#added
import 'package:flutter/material.dart';
import 'package:starbucks_secret_menu/tabs/calendar_tab.dart';
import 'package:starbucks_secret_menu/model/db.dart';
import 'package:starbucks_secret_menu/theme/theme.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: TITLE,
          themeMode: themeChanger.getTheme,
          darkTheme: Style.get(true),
          theme: Style.get(false),
          home: HomePage(),
        );
      }),
    );
  }
}






/*
@override
Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.isDarkTheme ? dark : light,
            home: Calendar(),
          );
        }),
  );
}

*/
