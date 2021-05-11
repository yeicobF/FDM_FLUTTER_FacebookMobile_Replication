import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// VARIABLES GLOBALES
import '../globals/global_values.dart' as global_values;

import '../widgets/first_login_screen/login_button.dart';
import '../widgets/login_screen_after_click/ForgotPassword.dart';
import '../widgets/login_screen_after_click/textFormField.dart';


// PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

class LoginScreenAfterClick extends StatelessWidget {
  final  Color fbButtonColor = const Color(0xFF03A9F4);
  final Color fbFontColor = const Color(0xFF4e9af5);
  final Color fbFontColor2 = const Color(0xFFFFFFFF);
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
                            const Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 60,
                            ),
                            // ),

                            const SizedBox(
                              height: 20,
                            ),
                            /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

                            showTextFormField("Correo electronico", fbFontColor2),

                            const SizedBox(
                              height: 5,
                            ),

                            showTextFormField("Contraseña", fbFontColor2),

                            const SizedBox(
                              height: 5,
                            ),

                            login_button(fbButtonColor, fbFontColor2),
                            
                            const SizedBox(
                              height: 5,
                            ),
                            ForgotPassword(fbFontColor),
                          ],
                        ),

                      ),
                    ],
                  ),
                )

            ),
          ],
        ),
      ),
    );
  }
}
