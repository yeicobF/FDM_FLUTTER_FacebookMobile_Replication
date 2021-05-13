// En este archivo se encontrará la Feed principal de Facebook después de haber
// pasado por las dos pantallas de inicio de sesión.

import 'package:flutter/material.dart';
// CAMBIAR EL COLOR DE LA STATUSBAR.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/main_feed_screen/facebook_top_bar.dart' as fb_top_bar;
import '../globals/global_values.dart' as global_values;

import '../widgets/main_feed_screen/ScrollFeed.dart' as scroll_feed;

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

    return Container(
      // color: global_values.darkBackground,
      child: scroll_feed.ScrollFeed("hola", Colors.blue),
      );
  }
}
