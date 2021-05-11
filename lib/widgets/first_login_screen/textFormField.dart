import 'package:flutter/material.dart';


Widget showTextFormField(String text, Color fontColor) {

  return TextFormField(
    decoration: InputDecoration(
      labelText: text,
      // fillColor: Colors.grey,
      ),
    
    style: TextStyle(
      color: fontColor,
      // decorationColor: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}
