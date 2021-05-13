import 'package:flutter/material.dart';
import '../globals/profile_picture.dart' as profile_picture;

Widget bottomPublication() {
  return Padding(
    padding: const EdgeInsets.only(top: 20,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.thumb_up_outlined,
          color: Colors.grey,
        ),
        Text("Like",  textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),

        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.chat_bubble_outline_outlined,
          color: Colors.grey,
        ),
        Text("Comment",
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.reply_outlined,
          color: Colors.grey,
        ),
        Text("Share",
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
