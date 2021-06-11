import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

// VARIABLES GLOBALES
import '../../../globals/global_values.dart' as global_values;

import '../../../widgets/first_login_screen/login_button.dart';
import '../../../widgets/login_screen_after_click/ForgotPassword.dart';
import '../../../widgets/login_screen_after_click/textFormField.dart';

// PANTALLA PRINCIPAL PARA EL LOGIN. Será la pantalla inicial.

class LoginScreenAfterClick extends StatelessWidget {
  final Color fbButtonColor = const Color(0xFF03A9F4);
  final Color fbFontColor = const Color(0xFF4e9af5);
  final Color fbFontColor2 = const Color(0xFFFFFFFF);
  final Color fbButtonColor2 = const Color(0xFF0F163D);
  final Color fbGray = const Color(0x636565);
// const Color fbFontColor = Color(0xFF4e9bf9);
  
  // Obtener el tamaño inicial de la pantalla para así, si cambia el tamaño
  // porque se ac
  // static const double? initialScreenHeight = null;
  // static const double initialScreenHeight = null;

  // Guardar si se comenzó a ingresar texto. Esto lo recibe desde la función
  // de las entradas de texto.
  static bool isInputActive = false;

  // Guardamos el tamaño de pantalla inicial y el actual.
  double initialScreenHeight = null;

  @override
  Widget build(BuildContext context) {   
    isInputActive = false; 
    // Si el tamaño inicial es null, darle el valor actual.
    initialScreenHeight ??= MediaQuery.of(context).size.height;

    print("initialScreenHeight: $initialScreenHeight");
    // print("PANTALLA ACTUAL: $screenHeight['current']");

    // TAMAÑO RELATIVO AL TAMAÑO DEL DISPOSITIVO CON
    // - FractionallySizedBox
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: global_values.darkBackground,
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
          body: SafeArea(
            child: // TAMAÑO RELATIVO AL TAMAÑO DEL DISPOSITIVO CON
                // - FractionallySizedBox
            LoginScreenContent(initialScreenHeight: initialScreenHeight, fbGray: fbGray, fbFontColor2: fbFontColor2, fbFontColor: fbFontColor),
          ),
        ));
  }
}

class LoginScreenContent extends StatelessWidget {
  LoginScreenContent({
    Key key,
    @required this.initialScreenHeight,
    @required this.fbGray,
    @required this.fbFontColor2,
    @required this.fbFontColor,
  }) : super(key: key);

  final double initialScreenHeight;
  final Color fbGray;
  final Color fbFontColor2;
  final Color fbFontColor;
  double currentScreenHeight;

  @override
  Widget build(BuildContext context) {


    return FractionallySizedBox(
      heightFactor: 1.0,
      widthFactor: 1.0,
      child: Builder(
        builder: (BuildContext newContext) {
          print(newContext.describeOwnershipChain("FractionallySizedBox").getProperties().asMap());
          print("newContext.size.height: ${MediaQuery.of(newContext).size.height}");
          print("newContext.owner: ${newContext.owner}");
          currentScreenHeight = MediaQuery.of(newContext).size.height;
          print(MediaQuery.of(newContext).viewPadding);
          print("currentScreenHeight: $currentScreenHeight");

          return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* ---------------------------- LOGO DE FACEBOOK ---------------------------- */

              // const Padding(
              //   padding: EdgeInsets.only(top: 120,),
              //   child:

              // LOGO DE FACEBOOK
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  width: 70,
                  child: Image.asset(
                    'assets/fb_official/logos/f_Logo_Online_04_2019/Color/PNG/f_logo_RGB-Blue_58.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              // ),
              /* ------------------------- ROW CON ÍCONO Y TEXTO. ------------------------- */

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: showTextFormField(
                      "Phone or email",
                      fbGray
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: showTextFormField(
                      "Password",
                      fbGray,
                      // Indicar que es contraseña.
                      isPassword: true
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: login_button(Colors.blueAccent, fbFontColor2),
                  ),
                ],
              ),

              Expanded(
                
                flex: 1,
                child: ForgotPassword(
                  fbFontColor,
                  alignment: 
                    (currentScreenHeight < initialScreenHeight)
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        );
        },
      ),
    );
  }
}
