import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'credit.dart';

double _leftRightPadding = 20;
double _topPadding = 10;

class CreditState extends State<Credit>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: const Text('Credit')),
      body: Container
      (
        padding: EdgeInsets.only(top: _topPadding, bottom: 0, left: _leftRightPadding, right: _leftRightPadding),
        child: Text("Credit Screen"),
      ),
    );
  }
}