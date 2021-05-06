import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
/* --------------------------- VARIABLES GLOBALES --------------------------- */

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



void main() {
  // Mandamos así la App para que se pueda obtener el tamaño de la statusBar.
  runApp(MaterialApp(home: MyApp()));
}

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
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        // appBar: AppBar(
        //   // AppBar tendrá el tamaño de la statusBar.
        //   toolbarHeight: 1,
        //   bottomOpacity: 0.4,
        //   backgroundColor: global_values.darkBackground, // status bar color
        //   // ÍCONOS DEL STATUS BAR: BLANCOS - Brightness.darkk
        //   brightness: Brightness.dark, // status bar brightness
        // ),
        body: SafeArea(
          child: FirstLoginScreen(),
        ),
      )
    );
  }
}
