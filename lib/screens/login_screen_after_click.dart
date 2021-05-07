// Pantalla de inicio de sesión después de dar click al botón de inicio de
// sesión: "Login Into Another Account".

import 'package:flutter/material.dart';

/* --------------------------- VARIABLES GLOBALES --------------------------- */

import '../globals/global_values.dart' as global_values;


// OBTENER COLORES DE LAS IMÁGENES: https://imagecolorpicker.com/

class LoginScreenAfterClick extends StatelessWidget {

/* -------------------------------- VARIABLES ------------------------------- */

  // MAPA CON VALORES DE COLORES DEL FONDO Y TEXTO DEL BOTÓN DE LOGIN.
  final loginButtonColors = {
  // final Color loginButtonBackground = Color(0xFF2d87ff);
  // final Color loginButtonFontColor = Color(0xFF242527);
    "background": const Color(0xFF2d87ff),
    "font": const Color(0xFF242527),
  };

  // Para los campos de ingreso de datos
  final inputTextBoxColors = {
    "placeholder": const Color(0xFF919296),
    "bottomLine": const Color(0xFF3a85e4),
  };

  final Color fbLogo = const Color(0xFF1878f3);
  // El fondo oscuro deberá ser un color global.
  // final Color darkBackground = const Color(0xFF242527);
  final Color forgotPasswordColorText = const Color(0xFF3a85e4);

/* --------------------- FUNCIÓN PARA CONSTRUIR PANTALLA -------------------- */
  @override
  Widget build(BuildContext context) {

    // Con FractionallySizedBox puedes hacer que el tamaño de lo que muestras
    // en pantalla sea relativo al tamaño máximo del dispositivo con los
    // atributos:
    // - widthFactor, heightFactor
    // 1 = TAMAÑO PANTALLA COMPLETA., 0.5 = TAMAÑO MITAD MEDIDA, ...
    return const FractionallySizedBox(

    );
  }
}
