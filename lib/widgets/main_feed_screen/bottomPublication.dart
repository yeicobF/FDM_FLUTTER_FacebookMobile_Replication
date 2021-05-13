import 'package:flutter/material.dart';

Widget bottomPublication() {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: const [
            Center(
              child: Icon(
                Icons.thumb_up_outlined,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Text(
                "Like",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Center(
              child: Icon(
                Icons.comment,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Text(
                "Comment",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Center(
              child: Icon(
                Icons.reply,
                color: Colors.grey,
              ),
            ),
            Center(
              child: Text(
                "Share",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ]
    )
  );
}
