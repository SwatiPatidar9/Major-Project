
import 'package:flutter/material.dart';

class AppStyle {
  static const Color white = Color(0xFFFFFFFF);//white
  static const Color Button = Color(0xFFDAC2F2);
  // static const Color container =  Color(0xFAE6AB9E);
  static const Color container =  Color(0xFFFFF3E0)
  ;

  // static const Color primary = Color(0xFF4CAF50); // Example: green
  static const Color border =  Color(0xFF6B6DB0); // Example: orange
  static const Color textHeading =Color(0xFF3A3A3A);
  static const Color textPrimary =Color(0xFF263257);
  static const Color textSecondary =Color(0xFF797B83);
  static const Color textButton =Colors.black;
  static const Color Red =Color(0xFFEA0000);
  static const Color grey =Color(0xFF717070);
  //static const Color error = Colors.red;
  //TextStyle
  static const Heading12Light = TextStyle(color:AppStyle.textSecondary,  fontSize: 12, fontFamily: "onest_medium");
  static const button16semiBold = TextStyle(color:AppStyle.textButton , fontSize: 13, fontFamily: "onest_bold");
  static const primary20Bold= TextStyle(color:AppStyle.textPrimary , fontSize: 20,fontFamily: " onest_bold");
  static const primary18extraBold= TextStyle(color:AppStyle.textPrimary , fontSize: 18,fontFamily: "  onest_extraBold");
  static const primary18SemiBold= TextStyle(color:AppStyle.textPrimary , fontSize: 18,fontFamily: " onest_semibold");
  static const Secondary14onestmedium = TextStyle(color:AppStyle.textSecondary ,  fontSize: 14,fontFamily: "onest_medium");
  static const Heading18Light = TextStyle(color:AppStyle.textHeading,  fontSize: 18, fontFamily: "onest_medium");
  static const button16Bold = TextStyle(color:AppStyle.textButton , fontSize: 16, fontFamily: "onest_bold");
  static const error18bold = TextStyle(color:AppStyle.Red , fontSize: 18, fontFamily: "onest_bold");
  static const text16bold = TextStyle(color:AppStyle.grey , fontSize: 14, fontFamily: "onest_medium");

//TextStyle(fontSize: 16, fontWeight: FontWeight.bold),


// TextStyle(
// fontFamily: 'Onest',
// fontSize: 18,
// fontWeight: FontWeight.w600,     // SemiBold
// height: 21 / 18,                  // Line height ratio
// letterSpacing: 0.36,              // 2% of 18px = 0.36
// textAlign: TextAlign.center,     // Use inside a Text widget
// )
}
