import 'package:flutter/material.dart';
import '../globals/profile_picture.dart' as profile_picture;

Widget superiorPublication(String userName, String pic) {
  return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: [
        profile_picture.createBareProfilePicture(50, pic, const EdgeInsets.only(right: 12)),
        Text(
            'Jacobo Flores Rodriguez \n 4h',
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
            )
        )
      ],
  );
}
