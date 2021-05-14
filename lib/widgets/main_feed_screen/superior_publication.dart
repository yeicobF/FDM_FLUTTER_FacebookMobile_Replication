import 'package:flutter/material.dart';

import '../../user/user.dart';

Widget superiorPublication(User currentUser, int index) {
  return Column(
    children: [
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.max,
        children: [
          currentUser.createBareProfilePicture(
            50,
            const EdgeInsets.only(right: 12)
          ),
          Text(
            currentUser.name,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
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
                Icons.more_horiz_outlined,
                color: Colors.black,
              ),
            ))
        ],
      ),
      // Publicación en texto.
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
          child: Text(
            currentUser.postList[index].caption,
            // Que el texto se acople dentro del contenedor.
            overflow: TextOverflow.clip,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ],
  );
}
