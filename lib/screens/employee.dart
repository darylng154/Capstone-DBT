import 'package:flutter/material.dart';

class Employee extends StatefulWidget
{

  Employee();

  @override
  State<StatefulWidget> createState() => EmployeeState();
}

double _leftRightPadding = 20;
double _topPadding = 10;

class EmployeeState extends State<Employee>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: const Text('Employee')),
      body: Container
        (
        padding: EdgeInsets.only(top: _topPadding, bottom: 0, left: _leftRightPadding, right: _leftRightPadding),
        child: Text("Employee Screen"),
      ),
    );
  }
}