import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MysignUp extends StatefulWidget {
  @override
  _MysignUpState createState() => _MysignUpState();
}

TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
String? name = stdin.readLineSync();
String? email = stdin.readLineSync();
String? pass = stdin.readLineSync();
int _radiovalue = 0;
bool hiddenpassword = true;

class _MysignUpState extends State<MysignUp> {
  int _radiovalue = 0;
  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.ubuntu(
                    textStyle:
                        const TextStyle(fontSize: 25, color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Register Account',
                  style: GoogleFonts.ubuntu(
                    textStyle:
                        const TextStyle(fontSize: 35, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'Complete your details or continue\n               with social media',
                    style: GoogleFonts.ubuntu(
                      textStyle:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22),
                        child: Container(
                          margin: const EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: TextField(
                                          controller: firstnameController,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                            ),
                                            labelText: "First Name",
                                            labelStyle: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            hintText: "First Name",
                                            hintStyle: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: TextField(
                                          controller: lastnameController,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                color: Colors.black54,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: const BorderSide(
                                                color: Colors.black54,
                                              ),
                                            ),
                                            labelText: "Lastname",
                                            labelStyle: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            hintText: "Lastname",
                                            hintStyle: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    controller: emailController,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.mail,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        labelText: 'Email or phone number',
                                        labelStyle: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        hintStyle: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              color: Colors.black54),
                                        ),
                                        hintText:
                                            'Enter your email or phone number'),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Gender :',
                                          style: GoogleFonts.ubuntu(
                                            textStyle: const TextStyle(
                                                fontSize: 25,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: Colors.deepOrange,
                                              value: 1,
                                              groupValue: _radiovalue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _radiovalue = value as int;
                                                });
                                              }),
                                          Text(
                                            'Male',
                                            style: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                              activeColor: Colors.deepOrange,
                                              value: 2,
                                              groupValue: _radiovalue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _radiovalue = value as int;
                                                });
                                              }),
                                          Text(
                                            'Female',
                                            style: GoogleFonts.ubuntu(
                                              textStyle: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    maxLength: 8,
                                    obscureText: hiddenpassword,
                                    controller: passController,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hiddenpassword = !hiddenpassword;
                                            });
                                          },
                                          icon: Icon(
                                            hiddenpassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.black,
                                          ),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.vpn_key,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        labelText: 'Password',
                                        labelStyle: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        hintStyle: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        hintText: 'Enter your password'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:  (Colors.green),
                                    fixedSize: const Size(320, 65),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  if (firstnameController.text.isEmpty ||
                                      lastnameController.text.isEmpty ||
                                      emailController.text.isEmpty ||
                                      passController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg:
                                            'please enter your name, email and password',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.SNACKBAR);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Signup Successful',textColor: Colors.black,
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.SNACKBAR);
                                    setSharedPref();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MySigin()));
                                  }
                                },
                                child: Text(
                                  'Continue',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        fontSize: 29, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('email', emailController.text);
    pref.setString('userfname', firstnameController.text);
    pref.setString('userlname', lastnameController.text);
    pref.setString('pass', passController.text);
  }
}
