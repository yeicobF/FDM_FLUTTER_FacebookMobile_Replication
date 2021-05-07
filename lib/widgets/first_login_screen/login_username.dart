// Este es el Widget del nombre de usuario en la primera pantalla del login.
// Se muestra la foto de perfil, el número de notificaciones, el nombre, y 3
// puntos (que son un botón).
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget userInfo() {
  return Padding(
    padding: const EdgeInsets.only(top: 40,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: [
        // CONTENEDOR PARA VER EL TAMAÑO DEL ROW.
        //         Container(
        //           // constraints: BoxConstraints.expand(),
        // 
        //           margin: const EdgeInsets.only(top: 40,),
        //           // width: double.infinity, // Me dieron problemas
        //           width: 350,
        //           height: 60,
        //           color: Colors.black,
        //         ),
        Container(
          width: 60,
          height: 60,
          // color: Colors.white,
          margin: const EdgeInsets.only(right: 10,),
          // PARA HACER EL CÍRCULO SEGUÍ LO SIGUIENTE:
          // https://stackoverflow.com/questions/50522237/flutter-circle-design/50524531
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/img/first_login_screen/profile_pic_1.jpg"),
              fit: BoxFit.cover,
            )
          ),
        ),
        const Text(
          "German Gonzalez",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )  
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
          )
        )
      ],
    ),
  );
}
