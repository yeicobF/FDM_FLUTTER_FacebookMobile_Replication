import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

// VARIABLES GLOBALES
import '../../../globals/global_values.dart' as global_values;

import '../../../widgets/first_login_screen/login_button.dart';
import '../../../widgets/login_screen_after_click/ForgotPassword.dart';
import '../../../widgets/login_screen_after_click/textFormField.dart';

// PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

class LoginScreenAfterClick extends StatelessWidget {
  final Color fbButtonColor = const Color(0xFF03A9F4);
  final Color fbFontColor = const Color(0xFF4e9af5);
  final Color fbFontColor2 = const Color(0xFFFFFFFF);
  final Color fbButtonColor2 = const Color(0xFF0F163D);
  final Color fbGray = const Color(0x636565);
// const Color fbFontColor = Color(0xFF4e9bf9);

  @override
  Widget build(BuildContext context) {
    // TAMAÑO RELATIVO AL TAMAÑO DEL DISPOSITIVO CON
    // - FractionallySizedBox
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
        title: 'Facebook Login Screen',
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
            child: // TAMAÑO RELATIVO AL TAMAÑO DEL DISPOSITIVO CON
                // - FractionallySizedBox
                FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              // UN CONTENEDOR PARA PODER ESTABLECER EL COLOR DEL FONDO DE LA PANTALLA.

              // UN CONTENEDOR PARA PODER ESTABLECER EL COLOR DEL FONDO DE LA PANTALLA.
              child: Container(
                color: global_values.darkBackground,

/* ------------- COLUMNA CON TODOS LOS ELEMENTOS DE LA PANTALLA ------------- */

                child: Column(
                  children: [
                    /* -------- ícono antes de agregar el PADDING a los demás elementos. -------- */


                    /* ------------ TODOS LOS BOTONES Y ELEMENTOS QUE TENDRÁN PADDING ----------- */
                    // SE PONE EL EXPANDED PARA QUE TOME EL TAMAÑO RESTANTE DE TODA LA
                    // PANTALLA, Y ASÍ SE PUEDAN REPARTIR LOS ELEMENTOS.
                    Expanded(
                        // color: fbButtonColor,
                        // Solo para poder ver el padding.

                        /* ------------- SE ESTABLECE EL PADDING DE TODOS LOS ELEMENTOS ------------- */

                        child: Padding(
                      padding: const EdgeInsets.all(
                        30,
                      ),

                      /* --- COLUMNA CON TODOS LOS ELEMENTOS A LOS QUE SE LES APLICÓ EL PADDING. -- */

                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // PONEMOS UN EXPANDED PARA QUE SE TOME LA MITAD DE LA
                          // PANTALLA, la cual se repartirá con el botón que estará
                          // hasta abajo de crear una nueva cuenta.
                          //
                          Expanded(
                            // Flex: 2, para que ocupe 2/3 partes del restante de la
                            // pantalla. El 1/3 restante lo tiene el botón de hasta
                            // abajo.
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                /* ---------------------------- LOGO DE FACEBOOK ---------------------------- */

                                // const Padding(
                                //   padding: EdgeInsets.only(top: 120,),
                                //   child:

                                Container(

                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/img/profile_pictures/invincible_1.png',
                                    width: 60,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                // ),
                                /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

                                showTextFormField(
                                    "Phone or email", fbGray),

                                const SizedBox(
                                  height: 5,
                                ),

                                showTextFormField("Password", fbGray),

                                const SizedBox(
                                  height: 5,
                                ),

                                login_button(Colors.blueAccent, fbFontColor2),

                                const SizedBox(
                                  height: 5,
                                ),
                                ForgotPassword(fbFontColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
