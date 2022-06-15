import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/home/tabbar_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meterial App',
      home: TwitterTabbarView(),
      theme: ThemeData.light().copyWith(
          appBarTheme:
              AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
          textTheme: Theme.of(context).textTheme.copyWith(
                  headline1: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              )),
          tabBarTheme: const TabBarTheme(
              labelColor: CupertinoColors.activeBlue,
              unselectedLabelColor: CupertinoColors.systemGrey)),
    );
  }
}
