import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/Home_View.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meterial App',
      home: HomeView(),
      theme: ThemeData.light().copyWith(
          appBarTheme:
              AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
          tabBarTheme: const TabBarTheme(
              labelColor: CupertinoColors.activeBlue,
              unselectedLabelColor: CupertinoColors.systemGrey)),
    );
  }
}
