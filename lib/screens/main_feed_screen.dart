// En este archivo se encontrará la Feed principal de Facebook después de haber
// pasado por las dos pantallas de inicio de sesión.

import 'package:flutter/material.dart';
// CAMBIAR EL COLOR DE LA STATUSBAR.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../user/user.dart';
import '../widgets/main_feed_screen/scroll_feed.dart' as scroll_feed;




class MainFeedScreen extends StatelessWidget {
  final fbColors = {
    "fbIconButton": const Color(0xFFf1f2f6),
    "fbIcon": const Color(0xFF010102),
  };

  @override
  Widget build(BuildContext context) {
        // CAMBIAR COLOR DEL statusBar
    // https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
    FlutterStatusbarcolor.setStatusBarColor(const Color(0xFFFFFFFF));
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false); // ÍCONOS NEGROS
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false); // ÍCONOS NEGROS
    
    final Size screenSize = MediaQuery.of(context).size;

    return scroll_feed.scrollFeed(User("Jacob Flores", "assets/user/profile_pictures/invincible_1.png"), "hola", Colors.blue);

//     return Column(
// 
//       // color: global_values.darkBackground,
//       children: [
//         fb_top_bar.createCircleButton(fbColors["fbIconButton"], 30, fbColors["fbIcon"], FontAwesomeIcons.search, 25),
//         Container(
//           width: 300,
//           // width: screenSize.width - 10,
//           // height: 300,
//           child: 
//             scroll_feed.scrollFeed("hola", Colors.blue)
//         ),
//         ]
//       // child: scroll_feed.scrollFeed("hola", Colors.blue),
//       );
  }
}
