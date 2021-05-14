// En este archivo se encontrará la Feed principal de Facebook después de haber
// pasado por las dos pantallas de inicio de sesión.

import 'package:flutter/material.dart';
// CAMBIAR EL COLOR DE LA STATUSBAR.
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../user/post.dart';
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

    // DIRECTORIO DE LAS IMÁGENES.
    const String profilePicsPath = "assets/user/profile_pictures";

    final Map<String, User> usersMap = {
      "german": User("Germán González", "$profilePicsPath/german.jpg"),
      "sergio": User("Sergio", "$profilePicsPath/sergio.jpg"),
      "rodrigo": User("Rodrigo", "$profilePicsPath/rodrigo.jpg"),
      "eduardo": User("Eduardo", "$profilePicsPath/eduardo_roca.jpg"),
    };

    // Agregaré algunos amigos solo como prueba.
    final List<User> friendsList = [
      usersMap["german"],
      usersMap["sergio"],
      usersMap["rodrigo"],
      usersMap["eduardo"],
    ];

    final List<String> imgPath = [];
    imgPath.add("assets/user/post_images/german.jpg");
    final Post postGerman = Post(
      "Hola, que tal.",
      imgPath
    );
    friendsList[0].addPost(postGerman);

    // Creo que mostraban lo mismo por ser el mismo apuntador.
    // imgPath.clear();

    final List<String> imgPathRodri = ["assets/user/post_images/rodrigo.jpg"];

    final Post postRodrigo = Post(
      "Isaac",
      imgPathRodri
    );
    friendsList[2].addPost(postRodrigo);
    
    final List<String> imgPathSergio = ["assets/user/post_images/sergio_1.jpg"];

    final Post postSergio = Post(
      "S",
      imgPathSergio
    );
    friendsList[1].addPost(postSergio);

    final List<String> imgPathEduardo = ["assets/user/post_images/eduardo_gambling.jpg"];

    final Post postEduardo = Post(
      "gambling",
      imgPathEduardo
    );
    friendsList[3].addPost(postEduardo);

    // Usuario actual.
    final User currentUser = User("Jacob Flores", "$profilePicsPath/invincible_1.png");
    // Agregar a todos los usuarios a la lista de amigos.
    // MÉTODO 1.
    currentUser.addFriends(friendsList);

    return scroll_feed.scrollFeed(currentUser, "hola", Colors.blue);

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
