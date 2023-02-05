import 'package:flutter/material.dart';

class Dispatcher extends StatefulWidget
{

  Dispatcher();

  @override
  State<StatefulWidget> createState() => DispatcherState();
}

double _leftRightPadding = 20;
double _topPadding = 10;

class DispatcherState extends State<Dispatcher>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: const Text('Dispatcher')),
      body: Container
        (
        padding: EdgeInsets.only(top: _topPadding, bottom: 0, left: _leftRightPadding, right: _leftRightPadding),
        child: Text("Dispatcher Screen"),
      ),
    );
  }
}