import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:tabbar/starter.dart';
import 'course.dart';
import 'customclass/route_generator.dart';
import 'progress.dart';
import 'diet.dart';
import 'explore.dart';
import 'settings.dart';
import 'common/constant.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  List<Widget> _widgets = [Course(), Progress(), Explore(), Diet(), Settings()];
  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        home: Scaffold(
            body: _widgets[index],
            bottomNavigationBar: ConvexAppBar(
              items: [
                TabItem(icon: Icons.local_library, title: 'Courses'),
                TabItem(icon: Icons.insert_chart, title: 'Progress'),
                TabItem(icon: Icons.wb_sunny, title: 'Explore'),
                TabItem(icon: Icons.local_dining, title: 'Diet'),
                TabItem(icon: Icons.settings, title: 'Settings'),
              ],
              backgroundColor: kBackgroundColor,
              activeColor: kPrimaryColor,
              color: kPrimaryColor,
              elevation: 5,
              height: 60,
              initialActiveIndex: 0, //optional, default as 0
              onTap: tapped,
            )),
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: kPrimaryColor,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: kTextColor)),
        debugShowCheckedModeBanner: false);
  }
}

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Starter(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
