import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      backgroundColor: Colors.amberAccent[100],
      body: Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
