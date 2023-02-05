import 'package:flutter/material.dart';

/* **********************************************************************
    File: ScreenResolution.dart
    Date: 01-19-2023
    Author Kirk Branner
    Copyright Information:
    Information contained herein is proprietary to and constitutes valuable
    confidential trade secrets of Top Run , or its licensors, and
    is subject to restrictions on use and disclosure.
    Copyright (c)  2023 Top Run Inc. All rights reserved.
    The copyright notices above do not evidence any actual or
    intended publication of this material.
    Description :
    Handles extracting the device screens's media width and height.
    Calculates ratios for the width and heigth based on reference
    from Kirk Branner's Samsung Galaxy A42 5G. Return values were 
    width of 384 and height of 805.
    This class is a classic singleton. 
 *************************************************************************/

class ScreenResolutionSingleton 
{
  static Size? mSize;
  static double referenceWidth = 384;
  static double referenceHeigth = 805;
  static double ? actualWidth = 384;
  static double ? actualHeigth = 805;
  static final ScreenResolutionSingleton _screenResolutionSingleton = 
                  ScreenResolutionSingleton._internal();

  factory ScreenResolutionSingleton() {
    return _screenResolutionSingleton;
  }
  ScreenResolutionSingleton._internal();


   /* **********************************************************************
      Function Name:  setScreenSize
      Input Parameters: a Size? 
      Output Parameter: None
      Description : Saves the size information for the Media
   *************************************************************************/
  void  setScreenSize(Size? size)
  {
      mSize = size;
      if ((mSize != null) && (mSize?.width != null))
      {
        actualWidth = mSize?.width;
      }
      if ((mSize != null) && (mSize?.height != null))
      {
        actualHeigth = mSize?.height;
      }
  }
 /* **********************************************************************
      Function Name:  getScreenWidth
      Input Parameters: none 
      Output Parameter: width of the media
      Description : Returns the Media width
   *************************************************************************/
  double? getScreenWidth()
  {
    return actualWidth;
  
  }
 /* **********************************************************************
      Function Name:  getScreenHeight
      Input Parameters: none 
      Output Parameter: height of the media
      Description : Returns the Media height
   *************************************************************************/
  double? getScreenHeight()
  {

    return actualHeigth;
  }

   /* **********************************************************************
      Function Name:  getScreenWidthRatio
      Input Parameters: none 
      Output Parameter: width of the media
      Description : Returns the ratio between measured width and reference width
   *************************************************************************/
  double? getScreenWidthRatio()
  {
     return  mSize!.width / referenceWidth;
  }
 /* **********************************************************************
      Function Name:  getScreenHeightRatio
      Input Parameters: none 
      Output Parameter: height of the media
      Description : Returns the ratio between measured height and reference height
   *************************************************************************/
  double? getScreenHeightRatio()
  {
     return  mSize!.height / referenceHeigth;
  }

  /* **********************************************************************
      Function Name:  getScreenHeightRatio
      Input Parameters: none 
      Output Parameter: height of the media
      Description : Returns the ratio between measured height and reference height
   *************************************************************************/
  num? getScreenHeightRatioNum()
  {
     return  mSize!.height / referenceHeigth;
  }


   /* **********************************************************************
      Function Name:  getScreenWidthRatio
      Input Parameters: none 
      Output Parameter: width of the media
      Description : Returns the the default ratio for the width
   *************************************************************************/
  double getScreenWidthDefaultRatio()
  {
     return  1.0;
  }
 /* **********************************************************************
      Function Name:  getScreenHeightDefaultRatio
      Input Parameters: none 
      Output Parameter: height of the media
      Description : Returns the default ratio for the height
   *************************************************************************/
  double getScreenHeightDefaultRatio()
  {
     return  1.0;
  }

}
