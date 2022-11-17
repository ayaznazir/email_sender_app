import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_sender/views/about_us.dart';
import 'package:email_sender/views/mail_send_screen.dart';
import 'package:email_sender/widgets/language_widget.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/src/public_ext.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? position1;
  bool? serviceEnabled;
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      return Future.error("Location Services are Disabled!");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permissions are Denied!");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location Permissions are permanently denied, we cannot Request permission.");
    }
    await Geolocator.getCurrentPosition().then((Position position) {
      setState(() {
        position1 = position;
      });
    });
    return null;
  }

  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan.shade200,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("servano").tr(),
        centerTitle: true,
        actions: [
          buildPopEnglish(context),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          CarouselSlider(
            items: [
              // 1st Image of Slider
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/1.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),

              //2nd Image of Slider
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/2.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),

              //3rd Image of Slider
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/3.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),

              //4th Image of Slider
              /*    Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/elect.png",
                        ),
                        fit: BoxFit.cover)),
              ),*/
              //5th Image of Slider
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/5.png",
                        ),
                        fit: BoxFit.cover)),
              ),

              Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/6.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),

              Container(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage(
                          "images/7.png",
                        ),
                        fit: BoxFit.cover)),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
              disableCenter: true,
            ),
          ),
          /* Container(
            width: screenSize.width,
            height: screenSize.height * 0.3,
            decoration: const BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    image: AssetImage(
                      "images/elect.png",
                    ),
                    fit: BoxFit.cover)),
          ),*/
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: Container(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.cyan,
                        child: Icon(
                          Icons.groups,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "nahan".tr(),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  int number = 00971504051089;
                  await launch("whatsapp://send?phone=$number");
                  // share();
                },
                child: Container(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.cyan,
                        child: Icon(
                          Icons.whatsapp,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "whatsapps".tr(),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MailSendScreen()));
                },
                child: Container(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.cyan,
                        child: Icon(
                          Icons.description,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "request".tr(),
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  /* Future<void> share() async {
    await WhatsappShare.share(
      text: 'Whatsapp share text',
      linkUrl: 'https://flutter.dev/',
      phone: '9232234223',
    );
  }*/
}

/*  Container(
              width: screenSize.width,
              height: screenSize.height * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.cyan,
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "call",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "+971504051089",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                share();
              },
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.cyan,
                      child: Icon(
                        Icons.whatsapp,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "whatsapp",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ).tr(),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "+971504051089",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MailSendScreen()));
              },
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.cyan,
                      child: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "email",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ).tr(),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "servano333@gmail.com",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.cyan,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "unitedarab",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ).tr(),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "unitedarab",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ).tr(),
                      ],
                    )
                  ],
                ),
              ),
            ),*/
