// BARRA SUPERIOR DEL MAIN FEED:
//
// - LOGO DE FACEBOOK, BOTÓN DE BÚSQUEDA, BOTÓN DE MESSENGER.
//

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget createFBTopBar() {

}

// Crear el botón de búsqueda o el de MESSENGER.
Widget createCircleButton(
  Color buttonColor, double buttonSize,
  Color iconColor, IconData icon, double iconSize) {

  // Si el tamaño del ícono no se especifica (null), se le da el valor default:
  // 24.0.

  iconSize ??= 24.0;

  // https://stackoverflow.com/questions/49991444/create-a-rounded-button-button-with-border-radius-in-flutter
  return Container(
    width: buttonSize,
    height: buttonSize,
      // https://stackoverflow.com/questions/49809351/how-to-create-a-circle-icon-button-in-flutter
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: buttonColor,
        padding: const EdgeInsets.all(0),
        shadowColor: Colors.transparent,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    ),
  );
}
