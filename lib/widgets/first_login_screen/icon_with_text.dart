// En este archivo se encontrarán los Widget de:
//
// - [ÍCONO] Log Into Another Account
// - [ÍCONO] Find Your Account
//
// - Va a ser una función que reciba:
//    
//    ÍCONO, TEXTO A MOSTRAR
//
// Así evitamos la redundancia en el código.

import 'package:flutter/material.dart';


Widget iconWithText(IconData icon, double iconSize, String text, Color buttonColor, Color fontColor) {

  // Si recibimos tamaño del ícono, lo dejamos así, pero si no recibimos nada,
  // utilizamos el "default", que es 24.0.

  // Estos operadores asignarán 24.0 a "iconSize" si su valor = NULL.
  // https://stackoverflow.com/questions/17006664/what-is-the-dart-null-checking-idiom-or-best-practice
  iconSize ??= 24.0; 

  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: buttonColor,
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: fontColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            textAlign: TextAlign.left,
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
