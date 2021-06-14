/// Programa en donde se inicia la app.

import 'package:flutter/material.dart';

import 'data/initial_data.dart';

/// Todas las pantallas.
import 'screens/screens.dart';

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
void main() {
  /// Establecer número de notificaciones del usuario actual.
  InitialData.currentUser.notificationsNumber = 1000;

  // Establecer los amigos del usuario actual.
  // InitialData.currentUser.friends = InitialData.friendsList;

  runApp(
    MaterialApp(
      /// PARA ELIMINAR LA ETIQUETA DE LA PARTE SUPERIOR DERECHA QUE INDICA
      /// "Debug".
      /// https://stackoverflow.com/questions/48893935/how-to-remove-the-flutter-debug-banner
      debugShowCheckedModeBanner: false, // No me funciona y no sé por qué.

      /// Navegar entre pantallas.
      ///
      /// https://flutter.dev/docs/cookbook/navigation/named-routes
      initialRoute: "/first_login",
      
      /// [routes] son las pantallas y su identificador en [String] para poder
      /// pasar de una pantalla a otra.
      routes: {
        "/first_login": (context) => FirstLoginScreen(
              currentUser: InitialData.currentUser,
            ),
        "/second_login": (context) => LoginScreenAfterClick(
              currentUser: InitialData.currentUser,
            ),
        "/home_screen": (context) => NavScreen(
              currentUser: InitialData.currentUser,
            ),
      },

      /// Ponemos las pantallas dentro de un [SafeArea] para que no ocupe el
      /// espacio de la barra de navegación ni la de notificaciones del celular.
      // home: SafeArea(
      //   child: screens[screenToShow],
      // ),
    ),
  );
}
// void main() => runApp(const FacebookScreens(screenNumber: 2));

// /// CLASE PROVISIONAL PARA MOSTRAR LAS PANTALLAS QUE HEMOS HECHO DEPENDIENDO DEL
// /// NÚMERO QUE RECIBA COMO PARÁMETRO.
// class FacebookScreens extends StatelessWidget {
//   /// El número de la pantalla a mostrar.
//   final int screenNumber;
// 
//   /// Las pantallas de la app.
//   List<Widget> get screens => [
//         FirstLoginScreen(),
//         LoginScreenAfterClick(),
//         NavScreen(),
//       ];
// 
//   const FacebookScreens({
//     Key key,
//     this.screenNumber = 0,
//   }) : super(key: key);
// 
//   /// CONSTRUCTOR QUE RECIBE EL NÚMERO DE LA PANTALLA A MOSTRAR.
// 
//   @override
//   Widget build(BuildContext context) {
//     // Si el número de pantalla es null, < 0, o mayor al número de pantallas,
//     // hacerlo 0.
//     //
//     // Si screenNumber == undefined o null, dar valor = 0, si no, tomar
//     // screenNumber.
//     int screenToShow = screenNumber ?? 0;
// 
//     // Revisar que el número de pantalla no exceda el número de pantallas.
//     if (screenNumber > (screens.length - 1)) screenToShow = 0;
// 
//     // int screenToShow = (screenNumber < 0
//     //                     || screenNumber > (screens.length - 1)
//     //                     || screenNumber == null)
//     //                     ? 0
//     //                     : screenNumber;
// 
//     return MaterialApp(
//       /// PARA ELIMINAR LA ETIQUETA DE LA PARTE SUPERIOR DERECHA QUE INDICA
//       /// "Debug".
//       /// https://stackoverflow.com/questions/48893935/how-to-remove-the-flutter-debug-banner
//       debugShowCheckedModeBanner: false, // No me funciona y no sé por qué.
// 
//       /// Navegar entre pantallas.
//       ///
//       /// https://flutter.dev/docs/cookbook/navigation/named-routes
//       initialRoute: "/",
//       routes: {
//         "/": (context) => FirstLoginScreen(),
//         "/second_login": (context) => LoginScreenAfterClick(),
//         "/home_screen": (context) => NavScreen(),
//       },
// 
//       /// Ponemos las pantallas dentro de un [SafeArea] para que no ocupe el
//       /// espacio de la barra de navegación ni la de notificaciones del celular.
//       // home: SafeArea(
//       //   child: screens[screenToShow],
//       // ),
//     );
//   }
// }
