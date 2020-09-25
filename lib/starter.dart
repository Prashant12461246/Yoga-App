import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tabbar/common/constant.dart';

class Starter extends StatefulWidget {
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: kOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/yoga1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Hi",
                style: Starter.style,
              ),
              Text(
                "It's Me",
                style: Starter.style,
              ),
              Text(
                "Sahdeep",
                style: Starter.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: kBottle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/yoga2.1.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Take a",
                style: Starter.style,
              ),
              Text(
                "look at",
                style: Starter.style,
              ),
              Text(
                "Liquid Swipe",
                style: Starter.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/yoga3.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Liked?",
                style: Starter.style,
              ),
              Text(
                "Fork!",
                style: Starter.style,
              ),
              Text(
                "Give Star!",
                style: Starter.style,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: kPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/yoga4.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Can be",
                style: Starter.style,
              ),
              Text(
                "Used for",
                style: Starter.style,
              ),
              Text(
                "Onboarding Design",
                style: Starter.style,
              ),
            ],
          ),
        ],
      ),
    )
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          page != pages.length - 1
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FlatButton(
                      onPressed: () {
                        liquidController.animateToPage(
                            page: pages.length - 1, duration: 500);
                      },
                      child: Text("Skip"),
                      color: Colors.white.withOpacity(0.01),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/second',
                        );
                      },
                      child: Text("Get started"),
                      color: Colors.white.withOpacity(0.01),
                    ),
                  ),
                ),
          page != pages.length - 1
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FlatButton(
                      onPressed: () {
                        liquidController.jumpToPage(
                            page: liquidController.currentPage + 1);
                      },
                      child: Text("Next"),
                      color: Colors.white.withOpacity(0.01),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FlatButton(
                      onPressed: () {
                        liquidController.animateToPage(page: 0, duration: 500);
                      },
                      child: Text("Again"),
                      color: Colors.white.withOpacity(0.01),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
