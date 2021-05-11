import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
/* --------------------------- VARIABLES GLOBALES --------------------------- */

// Se acceden los valores como: "global_values.variable"
import 'globals/global_values.dart' as global_values;

/* ------------------------------ LAS PANTALLAS ----------------------------- */
// PANTALLA INICIAL
import 'screens/first_login_screen.dart';
// PANTALLA DESPUÉS DE DAR CLICK A BOTÓN
import 'screens/login_screen_after_click.dart';
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
void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // CAMBIAR COLOR DEL statusBar
    // https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(global_values.darkBackground);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false); // ÍCONOS NEGROS
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true); // ÍCONOS BLANCOS
    // FlutterStatusbarcolor.setNavigationBarColor(Colors.black);
    // FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);

    // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Obtener altura de la STATUS BAR:
    // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
    return MaterialApp(
      title: 'Facebook',
      home: Scaffold(
        // ---------------------------------------------------------------------
        // CON EL APPBAR SE PUEDEN CAMBIAR LOS ATRIBUTOS DEL StatusBar respecto
        // a sus colores, pero es menos lío con "FlutterStatusbarcolor"
        //          ------------------------------------------
        // appBar: AppBar(
        //   // AppBar tendrá el tamaño de la statusBar.
        //   toolbarHeight: 1,
        //   bottomOpacity: 0.4,
        //   backgroundColor: global_values.darkBackground, // status bar color
        //   // ÍCONOS DEL STATUS BAR: BLANCOS - Brightness.darkk
        //   brightness: Brightness.dark, // status bar brightness
        // ),
        // ---------------------------------------------------------------------
        body: SafeArea(
          child: Login_screen_after_click(),
        ),
      )
    );
  }
}
