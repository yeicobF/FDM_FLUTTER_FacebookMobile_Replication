import 'package:flutter/material.dart';
// VARIABLES GLOBALES
import '../globals/global_values.dart' as global_values;

 // PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

class FirstLoginScreen extends StatelessWidget {
  final  Color fbButtonColor = const Color(0xFF273951);
  final Color fbFontColor = const Color(0xFF4e9af5);
// const Color fbFontColor = Color(0xFF4e9bf9);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        20,
      ),
      // width: 100,
      // height: 100,
      color: global_values.darkBackground,
      // Solo para poder ver el padding.
      child: Container(
        color: fbButtonColor,
      ),
    );
  }
}
