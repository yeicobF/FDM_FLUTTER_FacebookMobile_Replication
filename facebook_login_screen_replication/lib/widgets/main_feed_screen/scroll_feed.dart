import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'bottom_publication.dart' as bottom_publication;
import 'reaction_bar.dart';
import 'superior_publication.dart' as superior_pub;

Widget scrollFeed(User user) {
  String currPath = "";
  // Número total de publicaciones.
  int friendsTotalPublications = 0;

  // Contar el número total de publicaciones de todos los amigos.
  for (final User friend in user.friends) {
    friendsTotalPublications += friend.totalPosts;
  }

  return ListView.builder(
    // Solo mostrar las publicaciones de los amigos finitamente.
    itemCount: friendsTotalPublications,
    scrollDirection: Axis.vertical,
    itemBuilder: (_, friendNumber) {
      // CREO QUE MEJOR HAY QUE IMPLEMENTAR QUE EL MISMO AMIGO CREE POST POR
      // POST
      //
      // user.displayPost(int currentPost);

      // Cada que avanza el número de amigo se hace un MOD con el total para
      // que avance de 1 por 1, y cuando llegue al tamaño máximo valga 0.
      friendNumber %= user.friendsNumber;

      // print("ANTES friendNumber: $friendNumber");

      // Si el amigo actual no tiene posts, cambiar al siguiente amigo.
      // - Se cambia al siguiente amigo pero se pone en el rango correcto de
      // números.
      if (user.friends[friendNumber].postList.isEmpty) {
        // friendNumber++;

        // Se le suma 1 al número actual (que no tiene publicaciones) y se hace
        // el módulo para poder obtener el siguiente usuario.
        friendNumber = (friendNumber + 1) % user.friendsNumber;
      }

      // print("DESPUÉS friendNumber: $friendNumber");

      currPath = user.friends[friendNumber].postList[0].imgPathList[0];

      // for (final Post post in user.friends[friendNumber].postList) {
      //   currPath = post.imgPathList[0];
      // }

      // return Container(
      //   // color: Colors.blue,
      //   height: 30,
      //   width: 30,
      //   decoration: BoxDecoration(
      //     border: Border.all(color: Colors.blueAccent)
      //   ),
      // );

      // FUNCIONA
      return Center(
        // color: Colors.white,
        child: Container(
          constraints: const BoxConstraints(
            // Así se pone un ancho máximo. Dentro de un center y con los
            // constraints. Más que nada pensado para la vista web.
            maxWidth: 500,
          ),
          color: Colors.white,
          // width: 50,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: superior_pub.superiorPublication(
                    user.friends[friendNumber], 0),
              ),
              Container(
                width: double.infinity,
                child: Image.asset(
                  currPath,
                  // height: 200,
                  fit: BoxFit.fitWidth,
                ),
              ),
              // FUNCIONA
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Column(
                  children: [
                    reactionBar("255", "100"),
                    bottom_publication.bottomPublication(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: Container(
                  color: Colors.grey[400],
                ),
              )
            ],
          ),
        ),
      );
      // return publication.publication(path_photo, path_pic);
    },
  );
  // fillColor: Colors.grey,
}
