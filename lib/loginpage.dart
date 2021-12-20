import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlineshopping/dashboard.dart';
import 'package:onlineshopping/forgetpass.dart';
import 'package:onlineshopping/main.dart';
import 'package:onlineshopping/profile.dart';
import 'package:onlineshopping/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_button/sign_button.dart';
import 'package:google_fonts/google_fonts.dart';

class MySigin extends StatefulWidget {
  const MySigin({Key? key}) : super(key: key);

  @override
  _MySiginState createState() => _MySiginState();
}

class _MySiginState extends State<MySigin> {

  bool hiddenpassword = true;
  bool _checkbox = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  String email = 'sohan';
  String pass = '123';
 @override
  void initState() {
   getpref();
 }
  @override
  getpref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString('email')!;
      pass = pref.getString('pass')!;
    });
  }

  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Column(children: [
        Text(
          "Sign Up",
          style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(color: Colors.black54, fontSize: 20)),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'Welcome Back',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
              child: Text(
                  'Sign in with your email and password \n        or continue with social media',
                  style: GoogleFonts.ubuntu(
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.black54),
                  ))),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Email or phone number',
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: 'Enter your email or phone number'),
                  ),
                  const SizedBox(
                    height: 30,
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
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.black,
                              activeColor: const Color(0XFFFFA500),
                              value: _checkbox,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox = !_checkbox;
                                });
                              }),
                          Text(
                            'Remember me',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgetpass()));
                          },
                          child: Text(
                            'Forgot password',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: (Colors.green),
                fixedSize: const Size(320, 65),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              if (emailController.text.isEmpty || passController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: 'please enter your mail and password',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR);
              } else if (emailController.text == email &&
                  passController.text == pass) {
                Fluttertoast.showToast(
                    msg: 'Login Successful',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myhome()));
              } else {
                Fluttertoast.showToast(
                    msg: 'Please enter valid id and password',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR);
              }
            },
            child: Text(
              'Continue',
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(fontSize: 29, color: Colors.black),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Or',
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton.mini(
                buttonType: ButtonType.google,
                onPressed: () {},
              ),
              SignInButton.mini(
                buttonType: ButtonType.facebook,
                onPressed: () {},
              ),
              SignInButton.mini(
                buttonType: ButtonType.appleDark,
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: sohan1 / 1,
          margin: const EdgeInsets.only(top: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '''Don't have an account? ''',
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              children: [
                TextSpan(
                    text: 'Sign Up',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          fontSize: 20, color: Colors.green),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MysignUp()));
                      }),
              ],
            ),
          ),
        )
      ]),
    )));
  }
}
