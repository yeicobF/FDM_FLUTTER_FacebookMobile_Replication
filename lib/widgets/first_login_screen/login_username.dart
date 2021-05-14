// Este es el Widget del nombre de usuario en la primera pantalla del login.
// Se muestra la foto de perfil, el número de notificaciones, el nombre, y 3
// puntos (que son un botón).
import 'package:flutter/material.dart';

// USUARIO
import '../../user/user.dart';

Widget showUserInfo(
  User currentUser, double pictureSize, EdgeInsetsGeometry customPictureMargin) {
  // Guardar foto de perfil dependiendo de si tiene notificaciones o no.
  final Widget _profilePicture =
    (currentUser.notificationsNumber > 0)
    ? currentUser.createProfilePictureWithNotifications(
        pictureSize,
        customPictureMargin,
      )
    : currentUser.createBareProfilePicture(
        pictureSize,
        customPictureMargin
      );


  return Container(
    margin: const EdgeInsets.only(top: 40,),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: [
        // Aquí mostraremos una foto de perfil dependiendo de si tiene
        // notificaciones o no.
        _profilePicture,
        Text(
          currentUser.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
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
