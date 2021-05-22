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

// void main() => runApp(MaterialApp(home: first_login_screen.FirstLoginScreen()));
// void main() => runApp(MaterialApp(home: login_screen_after_click.LoginScreenAfterClick()));
void main() => runApp(FacebookScreens(0));

// CLASE PROVISIONAL PARA MOSTRAR LAS PANTALLAS QUE HEMOS HECHO DEPENDIENDO DEL
// NÚMERO QUE RECIBA COMO PARÁMETRO.
class FacebookScreens extends StatelessWidget {
  // El número de la pantalla.
  final int screenNumber;
  // Las pantallas.
  final List<Widget> screens = [
    first_login_screen.FirstLoginScreen(),
    login_screen_after_click.LoginScreenAfterClick(),
    main_feed_screen.MainFeedScreen(),
  ];
  
  FacebookScreens(this.screenNumber);


  @override
  Widget build(BuildContext context) {

    // Si el número de pantalla es null, < 0, o mayor al número de pantallas,
    // hacerlo 0.
    final int screenToShow = (screenNumber < 0
                              || screenNumber > (screens.length - 1)
                              || screenNumber == null)
                              ? 0
                              : screenNumber;

    return MaterialApp(
      // PARA ELIMINAR LA ETIQUETA DE LA PARTE SUPERIOR DERECHA QUE INDICA 
      // "Debug".
      // https://stackoverflow.com/questions/48893935/how-to-remove-the-flutter-debug-banner
      debugShowCheckedModeBanner: false, // No me funciona y no sé por qué.
      home: screens[screenToShow],
    );
  }
}
