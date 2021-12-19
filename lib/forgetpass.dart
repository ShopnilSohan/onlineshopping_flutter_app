
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/passentry.dart';
import 'package:onlineshopping/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Forgetpass extends StatefulWidget {

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController emailController = TextEditingController();
  String email='sohan';

  void initState() {
    getpref();
  }
  @override

  getpref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString('email')!;
    });
  }
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
                child: Center(
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(fontSize: 25, color: Colors.black54),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
             Center(
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(fontSize: 35, color: Colors.black),
                  ),
                ),
              ),
             Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                    child: Text(
                      'Please enter your email and if it is correct\nyou are allowed to change your password',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                    )),
              ),

              SizedBox(
                height: sohan*.2,
                  width: sohan1/1,
                  child: Image.asset('images/mails.png')),

              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.mail,
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
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Enter your email'),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                height: sohan / 12,
                width: sohan1 / 1.1,
                decoration: BoxDecoration(
                  color: const Color(0XFFff781f),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    if(email==emailController.text){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const PassEntry()));
                    }
                    else{
                      Fluttertoast.showToast(
                          msg:
                          'Please enter your valid email',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR);
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: sohan / 29),
                  ),
                ),
              ),
              const SizedBox(height: 60,),
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
                                fontSize: 20, color: Color(0XFFFFA500)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}