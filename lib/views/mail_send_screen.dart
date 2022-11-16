import 'dart:convert';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MailSendScreen extends StatefulWidget {
  const MailSendScreen({Key? key}) : super(key: key);

  @override
  State<MailSendScreen> createState() => _MailSendScreenState();
}

class _MailSendScreenState extends State<MailSendScreen> {
  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var phoneController = TextEditingController();
  var cityController = TextEditingController();
  var addressController = TextEditingController();
  var professionController = TextEditingController();
  var requiredController = TextEditingController();
  var dateVisitController = TextEditingController();
  var timeVisitController = TextEditingController();
  var locationController = TextEditingController();
  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_px63xwb";
    const templateId = "template_jx98yvm";

    final response = await http.post(url,
        headers: {
          "origin": "http://localhost",
          "Content-Type": "application/json"
        },
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": "phZYav4EJcjQxVN5C",
          "template_params": {
            "subject": professionController.text,
            "name": nameController.text,
            "message":
                "Name : ${nameController.text} , Email : ${mailController.text} ,  Phone number : ${phoneController.text} , City : ${cityController.text} , Address : ${addressController.text} , Required Profession : ${professionController.text} , Required Service : ${requiredController.text} , Required date to visit : ${dateVisitController.text} , Required time to visit : ${timeVisitController.text} , Latitude longitude : $name",
            "user_email": mailController.text,
          }
        }));
    print(response.statusCode);
    return response.statusCode;
  }

  Position? position1;
  String name = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("request").tr(),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "name".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.mail,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: mailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "enteremail".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.call,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "phone".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: cityController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "city".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: addressController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "address".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: professionController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "profession".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: requiredController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "required".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: dateVisitController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "datevisit".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                            child: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: timeVisitController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "timevisit".tr(),
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.cyan),
                        child: const Center(
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        cityController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        mailController.text.isEmpty ||
                        requiredController.text.isEmpty ||
                        professionController.text.isEmpty ||
                        dateVisitController.text.isEmpty ||
                        timeVisitController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "pleasefill".tr());
                    } else {
                      sendEmail().then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: "emailsend".tr());
                      });
                      /*  showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("enteremail").tr(),
                              content: Container(
                                width: screenSize.width,
                                height: screenSize.height * 0.06,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: screenSize.height * 0.06,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              bottomLeft: Radius.circular(40)),
                                          color: Colors.cyan),
                                      child: const Center(
                                          child: Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                      )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: mailController,
                                        decoration: InputDecoration(
                                            hintText: "enteryouremail".tr(),
                                            border: InputBorder.none),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      if (mailController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "enteryouremail".tr());
                                      } else {
                                        setState(() {
                                          isLoading = true;
                                        });

                                      }
                                    },
                                    child: const Text("submit").tr()),
                              ],
                            );
                          });*/
                    }
                  },
                  color: Colors.deepOrange,
                  minWidth: screenSize.width,
                  height: screenSize.height * 0.06,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "submit".tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )));
  }

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
        name =
            "${position1!.latitude.toString()} ${position1!.longitude.toString()}";
      });
    });
  }
}
