// PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

import 'package:flutter/material.dart';
// Íconos de Font Awesome.
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Cambiar colores de la "status bar" y la barra inferior con botones del
// celular.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

/* --------------------------- VARIABLES GLOBALES --------------------------- */

// Se acceden los valores como: "global_values.variable"
import '../globals/global_values.dart' as global_values;
// USUARIO
import '../user/user.dart';
/* ---------------- WIDGET DEL NOMBRE DEL USUARIO EN EL LOGIN --------------- */
import '../widgets/first_login_screen/create_new_fb_account.dart'
    as create_account;
import '../widgets/first_login_screen/icon_with_text.dart' as icon_with_text;
import '../widgets/first_login_screen/login_username.dart' as login_username;

class FirstLoginScreen extends StatelessWidget {
  final Color fbButtonColor = const Color(0xFF273951);
  final Color fbFontColor = const Color(0xFF4e9af5);
  // const Color fbFontColor = Color(0xFF4e9bf9);

  // DIRECTORIO DE LAS IMÁGENES.
  final String profilePicsPath = "assets/user/profile_pictures";

  // USUARIO ESTÁTICO PARA MOSTRARLO IGUAL EN TODOS LADOS.
  // Se inicializa en Build para poder enviar la variable "profilePicsPath" en
  // el constructor.
  static User currentUser;

  // Wiget que contiene a todos los elementos de la pantalla.
  Widget displayScreenElements() {
/* ------------- COLUMNA CON TODOS LOS ELEMENTOS DE LA PANTALLA ------------- */
    return Column(
      children: [
/* -------- ícono antes de agregar el PADDING a los demás elementos. -------- */

        const Padding(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          child: Align(
            // heightFactor: 1.4,
            alignment: Alignment.bottomLeft,
            // Ícono en esquina superior izquierda en donde se muestra la info.
            child: Icon(
              Icons.info_outline_rounded,
              size: 22,
              color: Colors.white,
            ),
          ),
        ),

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
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /* ---------------------------- LOGO DE FACEBOOK ---------------------------- */

                    // const Padding(
                    //   padding: EdgeInsets.only(top: 120,),
                    //   child:
                    const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 50,
                    ),
                    // ),

                    /* --------------- AGREGAMOS EL ROW CON LOS DATOS DEL USUARIO. -------------- */

                    login_username.showUserInfo(
                      currentUser,
                      65,
                      const EdgeInsets.only(right: 12)
                    ),
                    // Este es un separador entre la información del
                    // usuario y los botones.
                    const SizedBox(
                      height: 5,
                    ),
                    /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

                    icon_with_text.iconWithText(
                      Icons.add_sharp,
                      null, // null PARA QUE EL TAMAÑO DEL ÍCONO SEA EL DEFAULT.
                      "Log Into Another Account",
                      fbButtonColor,
                      fbFontColor),
                    icon_with_text.iconWithText(
                      Icons.search,
                      28,
                      // ES MÁS PARECIDO, PERO LA VERSIÓN "LIGHT" ES DE PAGA.
                      // FontAwesomeIcons.search,
                      "Find Your Account",
                      fbButtonColor,
                      fbFontColor)
                  ],
                ),
              ),

/* ---------- ÚLTIMO BOTÓN PARA CREAR UNA NUEVA CUENTA DE FACEBOOK ---------- */

              create_account.createNewFacebookAccountButton(
                fbButtonColor,
                fbFontColor,
              ),
            ],
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Agregaré algunos amigos solo como prueba.
    final List<User> friendsList = [
      User("Germán González", "$profilePicsPath/german.jpg"),
      User("Sergio", "$profilePicsPath/sergio.jpg"),
      User("Rodrigo", "$profilePicsPath/rodrigo.jpg"),
      User("Eduardo", "$profilePicsPath/eduardo_roca.jpg"),
    ];

    // Usuario actual.
    currentUser = User("Jacob Flores", "$profilePicsPath/invincible_1.png");
    // currentUser = friendsList[1];
    
    // Establecer número de notificaciones.
    currentUser.notificationsNumber = 1056;

    // Agregar a todos los usuarios a la lista de amigos.
    // MÉTODO 1.
    currentUser.addFriends(friendsList);

    // Agregar a todos los usuarios a la lista de amigos.
    // MÉTODO 2.
    //
    // for (final User friend in friendsList) {
    //   currentUser.addFriend(friend);
    // }


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
              child: Container(
                // Fondo de Facebook oscuro.
                color: global_values.darkBackground,
                // Mostrar todos los elementos de la pantalla.
                child: displayScreenElements(),
              ),
            ),
          ),
        ));
  }
}
