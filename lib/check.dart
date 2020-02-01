import 'package:flutter/material.dart';

class Checking  extends StatelessWidget {
  final str ;

  Checking(this.str);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text(str),
    ),
      body: Text("Hello"),
    );

  }
}
