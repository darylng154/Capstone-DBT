import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'account.dart';
import '../button/nav.dart';
import 'package:flutter_login/button/custom_icon_button.dart';

import 'package:flutter_login/TextFunc.dart';
import 'package:flutter_login/ScreenResolution.dart';


double _textFontSize = 12;
int _textMaxLines = 1;
double _textInputWidthPerc = 70;
double _agreeButtonWidthPerc = 0.4;
double _navButtonWidth = 0.4;

double _leftRightPadding = 20;
double _topPadding = 10;
double _setupBotPadding = 10;
double _zipRightPadding = 20;
double _buttonPadding = 40;


String _setupStr = "Setup account:";

class AccountState extends State<Account>
{
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text('Account')),
      body: Container
      (
        padding: EdgeInsets.only(top: _topPadding, bottom: 0, left: _leftRightPadding, right: _leftRightPadding),
        child: _form(),
      ),
    );
  }

  Widget _form()
  {
    Icon _offIcon = Icon(Icons.check_box_outline_blank_rounded);
    Icon _onIcon = Icon(Icons.check_box_outlined);
    Icon checkbox = _offIcon;
    CustomIconButton _agreeButton = CustomIconButton("I AGREE", _offIcon, _offIcon, _onIcon, width: _agreeButtonWidthPerc);

    return Form
    (
        key: _formKey,
        child:
        ListView
        (
          children: <Widget>
          [
            Container
            (
              padding: EdgeInsets.only(bottom: _setupBotPadding),
              alignment: Alignment.centerLeft,
              child: _textName(_setupStr)
            ),
            // _textRow("Email: ", widget.email),   // weird width spacing

            // account type drop down
            _textInput("Email", widget.email),
            _textInput("Password", widget.password),
            _textInput("Verify", widget.verify),
            _textInput("Phone", widget.phone),
            _textInput("Address", widget.address),
            _textInput("City", widget.city),

            Row
            (
              children:
              [
                // expanded with state drop down
                Expanded(child: _textInput("Zipcode", widget.zipcode)),
                Padding(padding: EdgeInsets.only(right: _zipRightPadding)),
                Expanded(child: _textInput("Country", widget.country)),
              ]
            ),

            Padding(padding: EdgeInsets.only(top: _buttonPadding)),
            _agreeButton,

            Padding(padding: EdgeInsets.only(top: _buttonPadding)),
            Nav('/credit', 'Next', width: _navButtonWidth),
          ],
        ),
    );
  }

  Widget _textRow(String label, String? field)
  {
    return Row
    (
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Expanded
        (
          child: FractionallySizedBox
          (
            widthFactor: 1,
            child: _textName(label),
          ),
        ),
        Expanded
        (
          child: FractionallySizedBox
          (
            widthFactor: 1,
            child: _textInput(label, field),
          ),
        ),
      ],
    );
  }

  Widget _textName(String field)
  {
    // return printAutoSizeText(field, textFontSize, false, textMaxLines);
    return FractionallySizedBox
    (
      widthFactor: 0.7,
      child:
    // return
      AutoSizeText
      (
        field,
        style: TextStyle
        (
          color: Colors.black,
          fontSize: _textFontSize,
          fontWeight: FontWeight.normal,
        ),
        maxLines: _textMaxLines,
      ),
    );
  }

  Widget _textInput(String? label, String? field)
  {
    // ScreenResolutionSingleton screenResol = ScreenResolutionSingleton();
    // double actualWidth = (_textInputWidthPerc * screenResol.getScreenWidth()!)/100;
    // return Container
    // (
    //   width: actualWidth,

    return FractionallySizedBox
    (
      // widthFactor: 0.7,  // comparing w/ screen res
      widthFactor: 1,
      child: TextFormField
      (
        decoration: InputDecoration
        (
          labelText: label,
        ),
        validator: (text)
        {
          if (text == null || text.isEmpty)
            return 'Please fill this out.';

          return null;
        },
        onChanged: (text) => setState((() => setInputField(field, text))),
      )
    );
  }

  Widget? setInputField(String? field, String? text)
  {
    if(field == widget.email)
    {
      widget.setEmail(text);
      print("email: ${widget.getEmail()} \n");
    }
    else if(field == widget.password)
    {
      widget.setPassword(text);
      print("password: ${widget.getPassword()} \n");
    }
    else if(field == widget.verify)
    {
      widget.setVerify(text);
      print("verify: ${widget.getVerify()} \n");
    }
    else if(field == widget.phone)
    {
      widget.setPhone(text);
      print("phone: ${widget.getPhone()} \n");
    }
    else if(field == widget.address)
    {
      widget.setAddress(text);
      print("address: ${widget.getAddress()} \n");
    }
    else if(field == widget.city)
    {
      widget.setCity(text);
      print("city: ${widget.getCity()} \n");
    }
    else if(field == widget.zipcode)
    {
      widget.setZipcode(text);
      print("zipcode: ${widget.getZipcode()} \n");
    }
    else if(field == widget.country)
    {
      widget.setCountry(text);
      print("country: ${widget.getCountry()} \n");
    }

    print("field: ${field}, text: ${text}");
    return null;
  }
}