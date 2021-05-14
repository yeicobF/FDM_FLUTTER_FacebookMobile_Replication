import 'package:flutter/material.dart';

import '../../user/user.dart';
import 'bottom_publication.dart' as bottom_publication;
import 'reaction_bar.dart';
import 'superior_publication.dart' as superior_pub;

Widget scrollFeed(User user, String text, Color fontColor) {
  return ListView.builder(
    // itemCount: 100,
    scrollDirection: Axis.vertical,
    itemBuilder: (_, index) {
      // return Container(
      //   // color: Colors.blue,
      //   height: 30,
      //   width: 30,
      //   decoration: BoxDecoration(
      //     border: Border.all(color: Colors.blueAccent)
      //   ),
      // );

      // FUNCIONA
      return  Center(

        // color: Colors.white,
        child: Container(
          constraints:  const BoxConstraints(
          // Así se pone un ancho máximo. Dentro de un center y con los
          // constraints. Más que nada pensado para la vista web.
          maxWidth: 500,
        ),
          color: Colors.white,
          // width: 50,
        child: Column(
          children: [
            superior_pub.superiorPublication(user),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/img/profile_pictures/invincible_1.png',
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            // FUNCIONA
            reactionBar("255", "100"),
            bottom_publication.bottomPublication(),
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
    }
  );
  // fillColor: Colors.grey,
}
