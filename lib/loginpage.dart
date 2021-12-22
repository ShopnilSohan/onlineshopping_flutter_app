import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlineshopping/dashboard.dart';
import 'package:onlineshopping/forgetpass.dart';
import 'package:onlineshopping/main.dart';
import 'package:onlineshopping/profile.dart';
import 'package:onlineshopping/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_button/sign_button.dart';
import 'package:google_fonts/google_fonts.dart';

class MySigin extends StatefulWidget {
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

  setloginvalue() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("login", "1");
  }

  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child:
      Column(children: [
        Text(
          "Sign Up",
          style: GoogleFonts.ubuntu(
              textStyle: TextStyle(color: Colors.black54, fontSize: 20)),
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'Welcome Back',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: Center(
              child: Text(
                  'Sign in with your email and password \n        or continue with social media',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(fontSize: 18, color: Colors.black54),
                  ))),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Email or phone number',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter your email or phone number'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    maxLength: 8,
                    obscureText: hiddenpassword,
                    controller: passController,
                    style: TextStyle(color: Colors.black),
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
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.ubuntu(
                        textStyle: TextStyle(color: Colors.black),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: GoogleFonts.ubuntu(
                        textStyle: TextStyle(color: Colors.black),
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
                              activeColor: Color(0XFFFFA500),
                              value: _checkbox,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox = !_checkbox;
                                });
                              }),
                          Text(
                            'Remember me',
                            style: GoogleFonts.ubuntu(
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: (Colors.green),
                fixedSize: Size(320, 65),
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
                setloginvalue();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Myhome()));
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
                textStyle: TextStyle(fontSize: 29, color: Colors.black),
              ),
            )),
        SizedBox(
          height: 10,
        ),
        Text(
          'Or',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton.mini(
                buttonType: ButtonType.google,
                onPressed: () {
                  _googleSignUp();
                },
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
        SizedBox(
          height: 20,
        ),
        Container(
          width: sohan1 / 1,
          margin: EdgeInsets.only(top: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '''Don't have an account? ''',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(fontSize: 20, color: Colors.black),
              ),
              children: [
                TextSpan(
                    text: 'Sign Up',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(fontSize: 20, color: Colors.green),
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

  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {
    }
  }

}
