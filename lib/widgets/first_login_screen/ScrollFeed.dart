import 'Publication.dart' as publication;
import 'bottomPublication.dart' as bottom_publication;
import 'superior_publication.dart' as superior_pub;
import 'package:flutter/material.dart';


Widget ScrollFeed(String text, Color fontColor) {

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
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            superior_pub.superiorPublication("German", "assets/img/profile_pictures/invincible_1.png"),
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/img/profile_pictures/invincible_1.png',
                width:  200,
                fit: BoxFit.fitWidth,
              ),
            ),
            // FUNCIONA
            bottom_publication.bottomPublication(),
            SizedBox(
              height: 20,
              child: Expanded(
                child: Container(
                  color: Colors.grey[400],
                ),
              ),
            )
          ],
        ),
      );
      


      // return publication.publication(path_photo, path_pic);
    }  
  );
  // fillColor: Colors.grey,

}
