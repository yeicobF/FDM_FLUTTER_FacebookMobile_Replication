import 'package:flutter/material.dart';
import '../globals/profile_picture.dart' as profile_picture;

Widget bottomPublication() {
  return Padding(
    padding: const EdgeInsets.only(top: 40,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.thumb_up_outlined,
          color: Colors.grey,
        ),
        Text("Like"),
        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.chat_bubble_outline_outlined,
          color: Colors.grey,
        ),
        Text("Comment"),
        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.reply_outlined,
          color: Colors.grey,
        ),
        Text("Share"),
      ],
    ),
  );
}
