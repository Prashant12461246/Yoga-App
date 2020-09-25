import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(child: Text("Progress"))));
  }
}
