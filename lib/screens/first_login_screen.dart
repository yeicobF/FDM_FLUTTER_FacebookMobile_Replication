import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// VARIABLES GLOBALES
import '../globals/global_values.dart' as global_values;
/* ---------------- WIDGET DEL NOMBRE DEL USUARIO EN EL LOGIN --------------- */
import '../widgets/first_login_screen/create_new_fb_account.dart' as create_account;
import '../widgets/first_login_screen/icon_with_text.dart' as icon_with_text;
import '../widgets/first_login_screen/login_username.dart' as login_username;

 // PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

class FirstLoginScreen extends StatelessWidget {
  final  Color fbButtonColor = const Color(0xFF273951);
  final Color fbFontColor = const Color(0xFF4e9af5);
// const Color fbFontColor = Color(0xFF4e9bf9);
  
  @override
  Widget build(BuildContext context) {
    // TAMAÑO RELATIVO AL TAMAÑO DEL DISPOSITIVO CON
    // - FractionallySizedBox
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      // UN CONTENEDOR PARA PODER ESTABLECER EL COLOR DEL FONDO DE LA PANTALLA.
      child: Container(
        color: global_values.darkBackground,

/* ------------- COLUMNA CON TODOS LOS ELEMENTOS DE LA PANTALLA ------------- */

        child: Column(
          children: [

  /* -------- ícono antes de agregar el PADDING a los demás elementos. -------- */

            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10,),
              child: Align(
                // heightFactor: 1.4,
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),

  /* ------------ TODOS LOS BOTONES Y ELEMENTOS QUE TENDRÁN PADDING ----------- */

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

  /* ---------------------------- LOGO DE FACEBOOK ---------------------------- */

                    const Padding(
                      padding: EdgeInsets.only(top: 120,),
                      child: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),

  /* --------------- AGREGAMOS EL ROW CON LOS DATOS DEL USUARIO. -------------- */

                    login_username.userInfo(),

  /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

                    icon_with_text.iconWithText(
                      Icons.add_sharp,
                      null, // null PARA QUE EL TAMAÑO DEL ÍCONO SEA EL DEFAULT.
                      "Log Into Another Account",
                      fbButtonColor,
                      fbFontColor
                    ),
                    icon_with_text.iconWithText(
                      Icons.search,
                      28,
                      // ES MÁS PARECIDO, PERO LA VERSIÓN "LIGHT" ES DE PAGA.
                      // FontAwesomeIcons.search,
                      "Find Your Account",
                      fbButtonColor,
                      fbFontColor
                    ),

  /* ---------- ÚLTIMO BOTÓN PARA CREAR UNA NUEVA CUENTA DE FACEBOOK ---------- */

                    create_account.createNewFacebookAccountButton(
                      fbButtonColor,
                      fbFontColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
