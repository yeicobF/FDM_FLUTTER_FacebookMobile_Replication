/// PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.
import 'package:flutter/material.dart';

/// Cambiar colores de la "status bar" y la barra inferior con botones del
/// celular.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart'
    show FlutterStatusbarcolor;

/// Íconos de Font Awesome.
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;

/// Paleta de colores.
import '../config/palette.dart' show Palette;
import '../data/initial_data.dart' show InitialData;

/// USUARIO
import '../models/models.dart' show User;

/// Primera pantalla de Login.
///
/// En esta pantalla se renderiza la foto de perfil, la cual indica el número de
/// notificaciones que el usuario no ha visto.
class FirstLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Establecer número de notificaciones del usuario actual.
    InitialData.currentUser.notificationsNumber = 1;

    // Establecer los amigos del usuario actual.
    InitialData.currentUser.friends = InitialData.friendsList;

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

    return Scaffold(
      // Obtener altura de la STATUS BAR:
      // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
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
      body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          // UN CONTENEDOR PARA PODER ESTABLECER EL COLOR DEL FONDO DE LA PANTALLA.
          child: Container(
      // Fondo de Facebook oscuro.
      color: Palette.darkBackground,
      // Mostrar todos los elementos de la pantalla.
      child: _DisplayAllScreenElements(currentUser: InitialData.currentUser),
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

                      _ShowUserInfo(
                        currentUser: currentUser,
                        pictureSize: 65,
                      ),
                      // Este es un separador entre la información del
                      // usuario y los botones.
                      const SizedBox(
                        height: 5,
                      ),
                      /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

                      _LargeIconAndTextButton(
                        icon: Icons.add_sharp,
                        // null, // null PARA QUE EL TAMAÑO DEL ÍCONO SEA EL DEFAULT.
                        text: "Log Into Another Account",
                        buttonColor: Palette.firstScreenColors["fbButtonColor"],
                        fontColor: Palette.firstScreenColors["fbFontColor"],
                      ),
                      _LargeIconAndTextButton(
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

                _CreateNewFacebookAccountButton(
                  buttonColor: Palette.firstScreenColors["fbButtonColor"],
                  fontColor: Palette.firstScreenColors["fbFontColor"],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Generador de botón con ícono + texto.
///
/// Esta clase manejará los [Widget]s que tienen el siguiente formato:
///
/// - [ÍCONO]  Log Into Another Account
/// - [ÍCONO] Find Your Account
class _LargeIconAndTextButton extends StatelessWidget {
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

  /// Constructor.
  const _LargeIconAndTextButton({
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
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),

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

/// Generador de botón para crear una nueva cuenta de facebook.
///
/// > "CREATE NEW FACEBOOK ACCOUNT"
class _CreateNewFacebookAccountButton extends StatelessWidget {
  /// Color del botón.
  final Color buttonColor;

  /// Color de la fuente.
  final Color fontColor;

  /// Constructor.
  const _CreateNewFacebookAccountButton({
    Key key,
    @required this.buttonColor,
    @required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PREFERIRÍA PONER UN "EXPANDED" en lugar de un "PADDING", pero como tengo
    // los elementos en distintas columnas y contenedores, cuando utilizo el
    // EXPANDED, la pantalla solo se ve del contenedor del primer contenedor, así
    // que mejor utilicé el PADDING, pero esto le quita la responsividad y solo se
    // vería igual en el mismo dispositivo (Google Pixel 2).
    //
    // - ESTO DE ARRIBA ERA PORQUE HABÍA PUESTO PADDING.

    /// CON [Expanded] SE TOMA TODO EL TAMAÑO RESTANTE DE LA PANTALLA, POR LO
    /// QUE TIENE CIERTO GRADO DE RESPONSIVIDAD.
    return Expanded(
      // padding: const EdgeInsets.only(top: 150),

      /// ALINEAMOS EL BOTÓN AL FONDO DEL TAMAÑO RESTANTE DE LA PANTALLA.
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 40,

          /// [width.infinity]: QUE EL ANCHO SEA EL MÁXIMO POSIBLE.
          ///
          /// https://stackoverflow.com/questions/50014342/button-width-match-parent
          width: double.infinity,

          /// Contenedor con el texto.
          child: Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(5.0),
            ),

            /// Centrar texto.
            child: Center(
              child: Text(
                "CREATE NEW FACEBOOK ACCOUNT",
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                  color: fontColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Muestra los datos del usuario.
///
/// Se muestran los siguientes delementos:
///
/// - foto de perfil
/// - número de notificaciones
/// - nombre
/// - Botón de más con 3 puntos (que son un botón).
class _ShowUserInfo extends StatelessWidget {
  /// Usuario actual que está utilizando la app.
  final User currentUser;

  /// Tamaño de la foto de perfil del usuario.
  final double pictureSize;

  const _ShowUserInfo({
    Key key,
    @required this.currentUser,
    @required this.pictureSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Guardar foto de perfil dependiendo de si tiene notificaciones o no.
    // final Widget _profilePicture = (currentUser.notificationsNumber > 0)
    //     ? currentUser.createProfilePictureWithNotifications(
    //         pictureSize,
    //         const EdgeInsets.only(right: 0),
    //       )
    //     : currentUser.createBareProfilePicture(
    //         pictureSize, const EdgeInsets.only(right: 0));

    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.max,
        children: [
          // Aquí mostraremos una foto de perfil dependiendo de si tiene
          // notificaciones o no.
          Container(
            /// Margin a la derecha de la foto de perfil.
            margin: const EdgeInsets.only(right: 12),
            child: (currentUser.notificationsNumber > 0)
                ? currentUser.createProfilePictureWithNotifications(
                    pictureSize,
                  )
                : currentUser.createBareProfilePicture(
                    pictureSize,
                  ),
          ),

          Text(
            currentUser.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // EXPANDED para que se ocupe todo el ancho restante. Si solo pongo el
          // container, no se adaptará el ancho
          Expanded(
            // ESTE DEBERÍA DE SER UN BOTÓN.
            child: Container(
              alignment: Alignment.centerRight,
              child: const Icon(
                // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
