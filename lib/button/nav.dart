import 'package:flutter/cupertino.dart';
import 'nav_state.dart';

class Nav extends StatefulWidget
{
  String route;
  String text;
  double? width;

  Nav(this.route, this.text, {this.width})
  {
    this.width = this.width == null ? this.width = 1 : this.width = this.width;
  }

  @override
  State<StatefulWidget> createState() => NavState();

  double? getWidth() {return width;}
  void setWidth(double? width) => width = width;
}