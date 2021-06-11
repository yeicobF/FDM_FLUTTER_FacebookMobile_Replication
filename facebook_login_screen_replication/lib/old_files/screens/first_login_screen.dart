/// PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

import 'package:flutter/material.dart';
// Cambiar colores de la "status bar" y la barra inferior con botones del
// celular.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart'
    show FlutterStatusbarcolor;
// Íconos de Font Awesome.
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;

/// Paleta de colores.
import '../config/palette.dart';

// USUARIO
import '../user/user.dart' show User;
/* ---------------- WIDGET DEL NOMBRE DEL USUARIO EN EL LOGIN --------------- */
import '../widgets/first_login_screen/create_new_fb_account.dart'
    as create_account;
import '../widgets/first_login_screen/login_username.dart' as login_username;

/// Primera pantalla de Login.
///
/// En esta pantalla se renderiza la foto de perfil, la cual indica el número de
/// notificaciones que el usuario no ha visto.
class FirstLoginScreen extends StatelessWidget {
  // const Color fbFontColor = Color(0xFF4e9bf9);

  // DIRECTORIO DE LAS IMÁGENES.
  final String profilePicsPath = "assets/user/profile_pictures";

  // USUARIO ESTÁTICO PARA MOSTRARLO IGUAL EN TODOS LADOS.
  // Se inicializa en Build para poder enviar la variable "profilePicsPath" en
  // el constructor.
  static User currentUser;

  @override
  Widget build(BuildContext context) {
    /// Lista de amigos.
    ///
    /// - Agregaré algunos amigos solo como prueba.
    final List<User> friendsList = [
      User(
        name: "Germán González",
        profilePicturePath: "$profilePicsPath/german.jpg",
      ),
      User(
        name: "Sergio",
        profilePicturePath: "$profilePicsPath/sergio.jpg",
      ),
      User(
        name: "Rodrigo",
        profilePicturePath: "$profilePicsPath/rodrigo.jpg",
      ),
      User(
        name: "Eduardo",
        profilePicturePath: "$profilePicsPath/eduardo_roca.jpg",
      ),
    ];

    /// Inicialización del usuario actual.
    currentUser = User(
      name: "Jacob Flores",
      profilePicturePath: "$profilePicsPath/invincible_1.png",
    );

    // currentUser = friendsList[1];

    /// Establecer número de notificaciones.
    currentUser.notificationsNumber = 1;

    /// Agregar a todos los usuarios a la lista de amigos.
    ///
    /// - MÉTODO 1.
    currentUser.addFriends(friendsList);

    /// Agregar a todos los usuarios a la lista de amigos.
    /// - MÉTODO 2.
    ///
    /// ```dart
    /// for (final User friend in friendsList) {
    ///   currentUser.addFriend(friend);
    /// }
    /// ```

    /// [FlutterStatusbarcolor.setStatusBarColor(Palette.darkBackground)]
    /// - CAMBIAR COLOR DEL statusBar.
    ///
    /// https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Palette.darkBackground);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false); // ÍCONOS NEGROS
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true); // ÍCONOS BLANCOS
    // FlutterStatusbarcolor.setNavigationBarColor(Colors.black);
    // FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);

    // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Obtener altura de la STATUS BAR:
    // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
    return Scaffold(
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
            color: Palette.darkBackground,
            // Mostrar todos los elementos de la pantalla.
            child: _DisplayAllScreenElements(currentUser: currentUser),
          ),
        ),
      ),
    );
  }
}

/// Muestra todos los elementos del Login Screen 1 en pantalla.
class _DisplayAllScreenElements extends StatelessWidget {
  /// Usuario actual.
  ///
  /// Es necesario para mostrar su información en la pantalla.
  final User currentUser;

  const _DisplayAllScreenElements({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) {
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
                          currentUser, 65, const EdgeInsets.only(right: 12)),
                      // Este es un separador entre la información del
                      // usuario y los botones.
                      const SizedBox(
                        height: 5,
                      ),
                      /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

                      _IconWithText(
                        icon: Icons.add_sharp,
                        // null, // null PARA QUE EL TAMAÑO DEL ÍCONO SEA EL DEFAULT.
                        text: "Log Into Another Account",
                        buttonColor: Palette.firstScreenColors["fbButtonColor"],
                        fontColor: Palette.firstScreenColors["fbFontColor"],
                      ),
                      _IconWithText(
                        icon: Icons.search,
                        iconSize: 28,
                        // ES MÁS PARECIDO, PERO LA VERSIÓN "LIGHT" ES DE PAGA.
                        // FontAwesomeIcons.search,
                        text: "Find Your Account",
                        buttonColor: Palette.firstScreenColors["fbButtonColor"],
                        fontColor: Palette.firstScreenColors["fbFontColor"],
                      )
                    ],
                  ),
                ),

/* ---------- ÚLTIMO BOTÓN PARA CREAR UNA NUEVA CUENTA DE FACEBOOK ---------- */

                create_account.createNewFacebookAccountButton(
                  Palette.firstScreenColors["fbButtonColor"],
                  Palette.firstScreenColors["fbFontColor"],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Generador de ícono + texto.
///
/// Esta clase manejará los [Widget]s que tienen el siguiente formato:
///
/// - [ÍCONO]  Log Into Another Account
/// - [ÍCONO] Find Your Account
class _IconWithText extends StatelessWidget {
  /// Ícono a mostrar.
  final IconData icon;

  /// Tamaño del ícono.
  ///
  /// Es opcional, ya que si no recibe ninguno, se da el valor default.
  final double iconSize;

  /// Texto a mostrar.
  final String text;

  /// Color del botón.
  final Color buttonColor;

  /// Color de la fuente del texto.
  final Color fontColor;

  const _IconWithText({
    Key key,
    @required this.icon,

    /// Parámetro opcional.
    ///
    /// Si no se le da un valor, se establece con el default, que es 24.
    this.iconSize = 24,
    @required this.text,
    @required this.buttonColor,
    @required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ! CÓDIGO ANTIGUO QUE ME PARECE IMPORTANTE RECORDAR:
    //
    // Si recibimos tamaño del ícono, lo dejamos así, pero si no recibimos nada,
    // utilizamos el "default", que es 24.0.

    // Estos operadores asignarán 24.0 a "iconSize" si su valor = NULL.
    // https://stackoverflow.com/questions/17006664/what-is-the-dart-null-checking-idiom-or-best-practice
    //
    // iconSize ??= 24.0;

    return Container(
      /// El [Container] solo es para establecer la altura de los botones y su
      /// margen superior.
      margin: const EdgeInsets.only(top: 18),
      height: 30,

      /// Ponemos un botón, que estará decorado con distintos [Widget]s.
      child: TextButton(
        /// Al presionar el botón queremos cambiar de pantalla.
        onPressed: () => print("\n Botón $text -> CAMBIAR DE PANTALLA"),
        style: ButtonStyle(

            /// Le quitamos [Padding] al botón, ya que agregaba uno indeseado.
            padding: MaterialStateProperty.all(EdgeInsets.zero)),

        /// Fila con el ícono y el texto.
        child: Row(
          children: [
            /// [Container] con  el ícono.
            Container(
              alignment: Alignment.bottomLeft,
              width: 30,
              decoration: BoxDecoration(
                color: buttonColor,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),

              /// [Center] para centrar el ícono.
              child: Center(
                child: Icon(
                  icon,
                  size: iconSize,
                  color: fontColor,
                ),
              ),
            ),

            /// [Padding] para agregar el texto.
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,

                  /// Espaciado entre los caracteres de la cadena.
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
