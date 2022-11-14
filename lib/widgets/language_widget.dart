import 'package:easy_localization/src/public_ext.dart';
import 'package:email_sender/main.dart';
import 'package:email_sender/views/home_screen.dart';
import 'package:flutter/material.dart';

Widget buildPopEnglish(BuildContext context) {
  var a = 0;
  var v = 0;
  var f = 0;
  var d = 0;
  var dd = 0;
  var cc = 0;
  var ccc = 0;
  var dcd = 0;
  return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      elevation: 20,
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Selected Languages :",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("English Language"),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200)),
                      child: const Image(
                        image: AssetImage("images/america.png"),
                        width: 40,
                        height: 40,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                  context.locale = const Locale('en', 'US');
                },
              ),
            ),
            PopupMenuItem(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false);
                  context.locale = const Locale('en', 'UA');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("اللغة العربية"),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200)),
                      child: const Image(
                        image: AssetImage("images/united.png"),
                        width: 40,
                        height: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]);
}
