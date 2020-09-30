import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tabbar/common/constant.dart';
import 'package:tabbar/component/body_diet.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      
      body: Body_Diet(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        Icon(
          Icons.search,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
          size: 40,
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        ),
      ],
    );
  }
}
