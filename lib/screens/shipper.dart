import 'package:flutter/material.dart';

class Shipper extends StatefulWidget
{

  Shipper();

  @override
  State<StatefulWidget> createState() => ShipperState();
}

double _leftRightPadding = 20;
double _topPadding = 10;

class ShipperState extends State<Shipper>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: const Text('Shipper')),
      body: Container
        (
        padding: EdgeInsets.only(top: _topPadding, bottom: 0, left: _leftRightPadding, right: _leftRightPadding),
        child: Text("Shipper Screen"),
      ),
    );
  }
}