/// Paletas de colores.

import 'package:flutter/material.dart';

/// Clase que contiene diversos colores que se manejarán en la app.
/// 
/// Entre los elementos se encuentran gradientes y colores en general.
/// 
/// - **Dado a que las variables son estáticas, la forma de acceder sería:**
///
/// > ```dart
/// >  Palette.nombreVariable
/// > ```
class Palette {
  /// Color blanco.
  static const Color white = Color(0xFFFFFFFF);

  /// Color del [Scaffold].
  static const Color scaffold = Color(0xFFF0F2F5);

  /// Colores que se manejan en la primera pantalla de Login.
  static const Map<String, Color> firstScreenColors = {
      "fbButtonColor": Color(0xFF273951),
      "fbFontColor": Color(0xFF4e9af5),
  };

  static const Map<String, Color> secondScreenColors = {

  };

  /// Color azul que se encuentra en Facebook.
  static const Color facebookBlue = Color(0xFF1777F2);

  /// Color azul más claro para botones.
  static const Color fbButtonLighterBlue = Color(0xFF3987ea);

  /// Color azul más claro para el texto.
  /// 
  /// Es más blanco que azul.
  static const Color fbFontLighterBlue = Color(0xFF97c6fe);

  /// Fondo oscuro de pantalla.
  static const Color darkBackground = Color.fromARGB(255, 36, 37, 39);

  /// Función para crear el gradiente de la sección [Room]s.
  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [
      Color(0xFF496AE1),
      Color(0xFFCE48B1),
    ],
  );

  /// Color verde que indica que un usuario está online.
  static const Color online = Color(0xFF4BCB1F);

    /// Color rojo para el círculo de las notificaciones.
  static const notificationsRed = Color(0xFFea2945);

  /// Gradiente lineal que se sobrepone a las historias ([Story]).
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black26,
    ],
  );
}
