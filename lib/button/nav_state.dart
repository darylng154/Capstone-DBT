import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'nav.dart';

class NavState extends State<Nav>
{
  @override
  Widget build(BuildContext context)
  {
    return FractionallySizedBox
    (
      widthFactor: widget.getWidth(),

      child: ElevatedButton
      (
        onPressed: ()
        {
          Navigator.pushNamed(context, widget.route);
        },
        child: Text(widget.text),
      ),
    );
  }
}