import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(child: Text("diet"))));
  }
}
