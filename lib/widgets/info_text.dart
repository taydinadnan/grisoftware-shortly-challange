//information text
import 'package:flutter/material.dart';

Widget infoText() {
  return Column(
    children: const [
      Center(
        child: Text(
          "Let's get started!",
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(53, 50, 62, 10),
              fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: SizedBox(
          width: 200,
          height: 60,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Paste your first link into the field to shorten it",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(76, 74, 85, 10),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
