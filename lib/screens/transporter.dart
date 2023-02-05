import 'package:flutter/material.dart';
import 'package:flutter_login/string.dart';

class Transporter extends StatefulWidget
{

  Transporter();

  @override
  State<StatefulWidget> createState() => TransporterState();
}

double _leftRightPadding = 20;
double _topPadding = 10;

class TransporterState extends State<Transporter>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text(transporterScreenAppBarText)),
      body: Container
      (
        padding: EdgeInsets.only(top: _topPadding, bottom: 0, left: _leftRightPadding, right: _leftRightPadding),
        // child: Text("Transporter Screen"),
        child: Text(transporterScreenBodyText),
      ),
    );
  }
}