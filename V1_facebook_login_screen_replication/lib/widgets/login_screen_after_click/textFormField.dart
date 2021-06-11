import 'package:flutter/material.dart';
import '../../screens/login_screen_after_click.dart';

const Map<String, Color> bottomBorderColors = {
  "blueFocus": Color(0xFF3987ea),
  "grayNotFocus": Color(0xFF505153),
};

const Color hintTextColor = Color(0xFF909195);
const Color cursorColor = Color(0xFF909195);

Widget showTextFormField(String text, Color fontColor,
                         {bool isPassword = false}) {
  return TextFormField(
    onTap: ()   {LoginScreenAfterClick.isInputActive = true;
      print("Input");},
    onEditingComplete: () {LoginScreenAfterClick.isInputActive = false;
      print("Salió");},
    textAlignVertical: TextAlignVertical.bottom,
    cursorColor: cursorColor,
    cursorWidth: 0.5,
    // Ocultar el texto (para la contraseña).
    obscureText: isPassword,
    // Para cambiar el color de la letra en el input.
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18, 
    ),
    decoration: InputDecoration(
      // labelText: "hola",
      // contentPadding: const EdgeInsets.only(bottom: 0.0),
      hintText: text,
      hintStyle: const TextStyle(
        color: hintTextColor,
        //decorationColor: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: bottomBorderColors["grayNotFocus"],
        ),
      ),
      // Borde inferior cuando se está escribiendo algo.
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: bottomBorderColors["blueFocus"],

          width: 2.0,
        ),
      ),
      // border: new UnderlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Colors.grey,
      //   ),
      // ),
      /*labelStyle: new TextStyle(
              color: const Color(0x0288D1)
          )*/
    ) // fillColor: Colors.gr
  );
}
