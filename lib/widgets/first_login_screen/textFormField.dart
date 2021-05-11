import 'package:flutter/material.dart';


Widget showTextFormField(String text, Color fontColor) {

  return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Container(
            // ignore: file_names
            child: TextFormField(
              decoration: InputDecoration(labelText: text),
              style: TextStyle(
                color: fontColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      )
  );
}
