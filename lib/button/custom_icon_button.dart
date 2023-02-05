import 'package:flutter/material.dart';
import 'custom_icon_button_state.dart';

double _defaultIconSize = 30;

class CustomIconButton extends StatefulWidget
{
  bool _isPressed;
  String text;

  double? width;
  // double? height;  // causes infinite height error

  Color? textColor;
  Color? bkgndColor;

  // double? iconSize;
  Icon icon;
  Icon offIcon;
  Icon onIcon;

  CustomIconButton(this.text, this.icon, this.offIcon, this.onIcon, {super.key, this.width, /*this.height,*/ this.textColor, this.bkgndColor, /*this.iconSize*/})
  :_isPressed = false
  {
    this.width = this.width == null ? this.width = 1 : this.width = this.width;
    // this.height = this.height == null ? this.height = 1 : this.height = this.height;
    this.textColor = this.textColor == null ? this.textColor = Colors.white : this.textColor = this.textColor;
    this.bkgndColor = this.bkgndColor == null ? this.bkgndColor = Colors.green : this.bkgndColor = this.bkgndColor;

    // this.iconSize = this.iconSize == null ? this.iconSize = _defaultIconSize : this.iconSize = this.iconSize;

    // this.icon = this.icon == null ? this.icon = Icon(Icons.check_box_outline_blank_rounded, size: this.iconSize) : this.icon = this.icon;
    // this.offIcon = this.offIcon == null ? this.offIcon = this.icon : this.offIcon = this.offIcon;
    // this.onIcon = this.onIcon == null ? this.onIcon = Icon(Icons.check_box_outlined, size: this.iconSize) : this.onIcon = this.onIcon;
  }

  @override
  State<StatefulWidget> createState() => CustomIconButtonState();

  bool getIsPressed() {return _isPressed;}
  void setIsPressed(bool isPressed) => _isPressed = isPressed;

  String getText() {return text;}
  void setText(String text) => text = text;
  double getTextSize() {return (text.length).toDouble();}

  double? getWidth() {return width;}
  void setWidth(double? width) => width = width;

  // double? getHeight() {return height;}
  // void setHeight(double? height) => height = height;

  Color? getTextColor() {return textColor;}
  void setTextColor(Color? color) => textColor = color;

  Color? getBkgndColor() {return bkgndColor;}
  void setBkgndColor(Color? color) => bkgndColor = color;

  Icon getIcon() {return icon;}
  void setIcon(Icon icon) => this.icon = icon;

  Icon getOffIcon() {return offIcon;}
  void setOffIcon(Icon offIcon) => this.offIcon = offIcon;

  Icon getOnIcon() {return onIcon;}
  void setOnIcon(Icon onIcon) => this.onIcon = onIcon;
}