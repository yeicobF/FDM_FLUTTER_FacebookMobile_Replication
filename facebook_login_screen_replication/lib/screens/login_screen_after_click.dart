/// Segunda pantalla de inicio de sesión.

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../config/palette.dart' show Palette;

/// Segunda pantalla de Login.
///
/// Aquí se ingresan los datos de inicio de sesión:
///
/// - Username
/// - Password

class LoginScreenAfterClick extends StatelessWidget {
  // Obtener el tamaño inicial de la pantalla para así, si cambia el tamaño
  // porque se ac
  // static const double? initialScreenHeight = null;
  // static const double initialScreenHeight = null;

  // Guardar si se comenzó a ingresar texto. Esto lo recibe desde la función
  // de las entradas de texto.
  static bool isInputActive = false;

  // Guardamos el tamaño de pantalla inicial y el actual.
  // double initialScreenHeight = null;

  @override
  Widget build(BuildContext context) {
    // isInputActive = false;

    // Si el tamaño inicial es null, darle el valor actual.
    // initialScreenHeight ??= MediaQuery.of(context).size.height;

    // print("PANTALLA ACTUAL: $screenHeight['current']");

    // TAMAÑO RELATIVO AL TAMAÑO DEL DISPOSITIVO CON
    // - FractionallySizedBox
    // CAMBIAR COLOR DEL statusBar
    // https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(Palette.darkBackground);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false); // ÍCONOS NEGROS
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true); // ÍCONOS BLANCOS
    // FlutterStatusbarcolor.setNavigationBarColor(Colors.black);
    // FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);

    // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
    // final double statusBarHeight = MediaQuery.of(context).padding.top;

    // Obtener altura de la STATUS BAR:
    // https://stackoverflow.com/questions/64873410/how-to-get-status-bar-height-in-flutter
    return const Scaffold(
      backgroundColor: Palette.darkBackground,
      // resizeToAvoidBottomInset: false,
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
      body: _LoginScreenContent(),
    );
  }
}

/// Contenidos de la segunda pantalla de Login ([LoginScreenAfterClick]).
class _LoginScreenContent extends StatelessWidget {
  // double currentScreenHeight;

  const _LoginScreenContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* ---------------------------- LOGO DE FACEBOOK ---------------------------- */

          // const Padding(
          //   padding: EdgeInsets.only(top: 120,),
          //   child:

          /// LOGO DE FACEBOOK
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_58.png',
              width: 70,
              fit: BoxFit.fitWidth,
            ),
          ),
          // ),
          /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: const _TextInputField(
                  hintText: "Phone or email",
                  isPassword: false,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: const _TextInputField(
                  hintText: "Password",
                  isPassword: true,
                ),
              ),
              _LoginButton(
                onPressed: () => print("Log In"),
              ),
            ],
          ),

          const Expanded(
            flex: 1,
            child: _ForgotPassword(),
          ),
        ],
      ),
    );
  }
}

/// Clase para crear un cuadro de entrada de texto.
///
/// Este puede mostrar sus caracteres dependiendo de si se trata de una
/// contraseña o no. Esto lo determina el atributo [isPassword].
///
/// **NOTA: [hintText] es como un placeholder.**
class _TextInputField extends StatelessWidget {
  /// Colores para el borde inferior del cuadro de entrada de texto.
  ///
  /// Este es diferente cuando está activo y cuando no lo está.
  Map<String, Color> get bottomBorderColors => const {
        "blueFocus": Color(0xFF3987ea),
        "grayNotFocus": Color(0xFF505153),
      };

  /// Color de la barra vertical que indica que el cuadro de texto está activo.
  Color get cursorColor => const Color(0xFF909195);

  /// Color del [hintText], que es como un placeholder.
  Color get hintTextColor => const Color(0xFF909195);

  /// [hintText] del cuadro de texto para cuando no está activo.
  final String hintText;

  /// Indicador de si es una contraseña o no.
  final bool isPassword;

  /// Tamaño de la fuente cuando está ingresando texto.
  final double inputFontSize; 

  const _TextInputField({
    Key key,
    @required this.hintText,
    @required this.isPassword,
    this.inputFontSize = 21.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        LoginScreenAfterClick.isInputActive = true;
        print("Input");
      },
      onEditingComplete: () {
        LoginScreenAfterClick.isInputActive = false;
        print("Salió");
      },
      textAlignVertical: TextAlignVertical.bottom,
      cursorColor: cursorColor,
      cursorWidth: 0.5,
      // Ocultar el texto (para la contraseña).
      obscureText: isPassword,
      // Para cambiar el color de la letra en el input.
      style: TextStyle(
        color: Colors.white,
        fontSize: inputFontSize,
      ),
      decoration: InputDecoration(
        // labelText: "hola",
        // contentPadding: const EdgeInsets.only(bottom: 0.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
          //decorationColor: Colors.grey,
          fontSize: inputFontSize - 1.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.1,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: bottomBorderColors["grayNotFocus"],
          ),
        ),
        // Borde inferior cuando se está escribiendo algo.
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: bottomBorderColors["blueFocus"],
            width: 2.0,
          ),
        ),
        // border: new UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.grey,
        //   ),
        // ),
        /*labelStyle: new TextStyle(
              color: const Color(0x0288D1)
          )*/
      ), // fillColor: Colors.gr
    );
  }
}

/// Botón de Log In.
///
/// Este botón permite iniciar sesión y avanzar a la siguiente pantalla.
class _LoginButton extends StatelessWidget {
  /// Función a ejecutar al presionar el botón.
  final void Function() onPressed;

  /// Color de la fuente.
  final Color fontColor;

  /// Tamaño de la fuente.
  final double fontSize;

  /// Color del botón.
  final Color buttonColor;


  const _LoginButton({
    Key key,
    @required this.onPressed,
    this.buttonColor = const Color(0xFF3987ea),

    // this.buttonColor = Colors.blueAccent,
    this.fontColor = const Color(0xFF97c6fe),

    this.fontSize = 19.0,
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

    // CON EXPANDED SE TOMA TODO EL TAMAÑO RESTANTE DE LA PANTALLA, POR LO QUE
    // TIENE CIERTO GRADO DE RESPONSIVIDAD.
    return Container(
      /// [width]: [double.infinity] -> Toma todo el ancho disponible en la
      /// pantalla.
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: Text(
          "Log In",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: fontColor,
          ),
        ),
      ),
    );

//     Align(
//       alignment: Alignment.bottomCenter,
//       child: SizedBox(
//         height: 40,
//
//         /// [double.infinity]: QUE EL ANCHO SEA EL MÁXIMO POSIBLE.
//         /// https://stackoverflow.com/questions/50014342/button-width-match-parent
//         width: double.infinity,
//         child: Container(
//           decoration: BoxDecoration(
//             color: buttonColor,
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//
//           ),
//         ),
//       ),
//     );
  }
}

/// Texto que indica la siguiente leyenda:
///
/// "Forgot Password?"
class _ForgotPassword extends StatelessWidget {
  /// Color de la fuente.
  final Color fontColor;

  /// Alineación del texto.
  ///
  /// Este parámetro es porque el elemento se encuentra normalmente en el fondo
  /// inferior de la pantalla, pero cuando se comienza a ingresar texto, se pega
  /// a la parte superior. Es decir, que al estar activo el cuadro de entrada de
  /// texto, se acerca la leyenda debajo del cuadro de entrada de contraseña.
  final AlignmentGeometry alignment;

  const _ForgotPassword({
    Key key,
    this.fontColor = const Color(0xFF4e9af5),

    /// Por default se inicializará en la parte inferior si no se envía el
    /// parámetro.
    this.alignment = Alignment.bottomCenter,
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

    // CON EXPANDED SE TOMA TODO EL TAMAÑO RESTANTE DE LA PANTALLA, POR LO QUE
    // TIENE CIERTO GRADO DE RESPONSIVIDAD.
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: 40,
        // QUE EL ANCHO SEA EL MÁXIMO POSIBLE.
        // https://stackoverflow.com/questions/50014342/button-width-match-parent
        width: double.infinity,
        child: Center(
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
