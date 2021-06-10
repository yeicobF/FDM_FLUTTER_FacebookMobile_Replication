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

  return Container(
    // El container solo es para establecer la altura de los botones y su
    // margen superior.
    margin: const EdgeInsets.only(top: 18),
    height: 30,

    // Ponemos un botón, que estará decorado con distintos WIDGETS.
    child:TextButton(
      // Al presionar el botón queremos cambiar de pantalla.
      onPressed: (){ print("\n" + text + " -> CAMBIAR DE PANTALLA");},
      style: ButtonStyle(
        // Le quitamos Padding al botón, ya que agregaba uno indeseado.
        padding: MaterialStateProperty.all(EdgeInsets.zero)
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
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
    )
  );
}
