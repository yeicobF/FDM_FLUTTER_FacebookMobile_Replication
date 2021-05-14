import 'package:flutter/material.dart';

/* ------------------------------ LAS PANTALLAS ----------------------------- */
// PANTALLA INICIAL
import 'screens/first_login_screen.dart' as first_login_screen;
// PANTALLA DESPUÉS DE DAR CLICK A BOTÓN
import 'screens/login_screen_after_click.dart' as login_screen_after_click;
// PANTALLA DE FEED PRINCIPAL.
import 'screens/main_feed_screen.dart' as main_feed_screen;
/* -------------------------------------------------------------------------- */

// Guardar colores en HEXADECIMAL.
// https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
//
/* -------------------------------------------------------------------------- */

// Color(0x_OPACIDAD_HexColor)
// Color(0xFF_HexColor)
// FF = 100%, F2 = 95%, ...

// Mandamos así la App para que se pueda obtener el tamaño de la statusBar.
// - Me refiero al runApp(MaterialApp(home: Aplicacion()));

void main() => runApp(MaterialApp(home: first_login_screen.FirstLoginScreen()));
// void main() => runApp(MaterialApp(home: login_screen_after_click.LoginScreenAfterClick()));
// void main() => runApp(MaterialApp(home: main_feed_screen.MainFeedScreen()));
