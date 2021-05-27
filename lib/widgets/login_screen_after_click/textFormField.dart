import 'package:flutter/material.dart';


Widget showTextFormField(String text, Color fontColor) {

  return TextFormField(
    decoration: InputDecoration(
      hintText: text,
      hintStyle: TextStyle(
        color: Colors.grey,
        //decorationColor: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
  enabledBorder: new UnderlineInputBorder(
  borderSide: BorderSide(
  color: Colors.grey,
  ),
  ),
      focusedBorder: new UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      border: new UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
        /*labelStyle: new TextStyle(
            color: const Color(0x0288D1)
        )*/
    )    // fillColor: Colors.gr
  );
}
