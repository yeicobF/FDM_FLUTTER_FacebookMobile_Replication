import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// VARIABLES GLOBALES
import '../globals/global_values.dart' as global_values;
/* ---------------- WIDGET DEL NOMBRE DEL USUARIO EN EL LOGIN --------------- */
import '../widgets/login_username.dart' as login_username;

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
      child: Container(
        color: global_values.darkBackground,
        child: Column(
        children: [
          // Un ícono antes de agregar el PADDING a los demás elementos.
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
          Container(
            padding: const EdgeInsets.all(
              30,
            ),
            // color: fbButtonColor,
            // Solo para poder ver el padding.
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 120,),
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  login_username.userInfo(),
                ],
              ),
            ),
        ],
        
      ),
      ),
    );
  }
}
