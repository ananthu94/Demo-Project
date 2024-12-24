import 'package:flutter/material.dart';

Widget buildPage(
        {required MaterialColor color,
        required String urlimage,
        required String title,
        required String subtitle}) =>
    Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              urlimage,
              fit: BoxFit.fitHeight,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white60, fontSize: 18),
          ),
        ],
      ),
    );
