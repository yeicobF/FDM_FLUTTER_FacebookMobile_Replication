import 'package:flutter/material.dart';

Widget reactionBar(String reactions, String comments) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.max,
      children: const [
        Icon(
          // FontAwesomeIcons.ellipsisV, // ESTÁ MÁS ROBUSTO
          Icons.favorite,
          color: Colors.red,
        ),
        Text(
          "255",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text(".                                                                                                                                                                                                                                    ."),
        Expanded(
            child: Text(
          "100 Comments",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
      ],
    ),
  );
}
