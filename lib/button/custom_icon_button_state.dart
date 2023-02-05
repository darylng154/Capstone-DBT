import 'package:flutter/material.dart';
import 'custom_icon_button.dart';

double _textSize = 12;
double _buttonRightPadding = 28;

class CustomIconButtonState extends State<CustomIconButton>
{
  @override
  Widget build(BuildContext context)
  {
    return Row
    (
      children:
      [
        // Expanded(child: checkbox),
        widget.getIcon(),
        Expanded
        (
          child: FractionallySizedBox
          (
            widthFactor: widget.getWidth(),

            // child: Expanded(
            child: Container
            (
              padding: EdgeInsets.only(right: _buttonRightPadding),
              child: ElevatedButton
              (
                style: ElevatedButton.styleFrom
                (
                  // background color
                  backgroundColor: widget.getBkgndColor(),
                  // text color
                  foregroundColor: widget.getTextColor(),
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide
                    (
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),

                onPressed:()
                {
                  _toggleButton();
                },

                child: Text
                (
                  widget.getText(),
                  // allows Text to go outside of Button but is not centered
                  // softWrap: false,
                  // style: const TextStyle
                  // (
                  //   overflow: TextOverflow.visible
                  // ),
                  style: TextStyle
                  (
                    fontSize: _textSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _toggleButton()
  {
    // print("inside button: ${widget.getIsPressed()}");
    // print("inside button, icon: ${widget.getIcon()}");
    // print("inside button, offIcon: ${widget.offIcon}");
    // print("inside button, onIcon: ${widget.onIcon}");

    setState(()
    {
      if(widget.getIsPressed())
      {
        widget.setIcon(widget.getOffIcon());
        widget.setIsPressed(false);
      }
      else
      {
        widget.setIcon(widget.getOnIcon());
        widget.setIsPressed(true);
      }
    });
  }
}