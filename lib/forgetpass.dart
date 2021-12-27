import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/otp.dart';
import 'package:onlineshopping/passentry.dart';
import 'package:onlineshopping/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class Forgetpass extends StatefulWidget {
  @override
  State<Forgetpass> createState() => _ForgetpassState();

}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController emailController = TextEditingController();
  String email = 'sohan@gmail.com';


  void initState() {
    getpref();
    generateRandomNumber();
  }

  @override
  getpref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString('email')!;
    });
  }

  int number = 0;

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
                      textStyle:
                          const TextStyle(fontSize: 25, color: Colors.black54),
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
                    textStyle:
                        const TextStyle(fontSize: 35, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                    child: Text(
                  'Please enter your email and if it is correct\nyou are allowed to change your password',
                  style: GoogleFonts.ubuntu(
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                )),
              ),
              SizedBox(
                  height: sohan * .2,
                  width: sohan1 / 1,
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
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    if (email == emailController.text) {
                      mail();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>Otps(number.toString())));
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please enter your valid email',
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
              const SizedBox(
                height: 60,
              ),
              Container(
                width: sohan1 / 1,
                margin: const EdgeInsets.only(top: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '''Don't have an account? ''',
                    style: GoogleFonts.ubuntu(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    children: [
                      TextSpan(
                          text: 'Sign Up',
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                          )),
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

  Future mail() async {
    final smtpServer = gmail('shopnilsohan01@gmail.com', 'sohan2011s');
    final message = Message()
      ..from = Address('shopnilsohan01@gmail.com', 'Shopnil Sohan')
      ..recipients.add(emailController.value.text)
      ..subject = 'Otp verification'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          '''<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
  <div style="margin:50px auto;width:70%;padding:20px 0">
    <div style="border-bottom:1px solid #eee">
      <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">ShopTown</a>
    </div>
    <p style="font-size:1.1em">Hi,</p>
    <p>Thank you for choosing our Brand. Use the following OTP to complete your Sign Up procedures. OTP is valid for 5 minutes</p>
    <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">$number</h2>
    <p style="font-size:0.9em;">Regards,<br />ShopTown</p>
    <hr style="border:none;border-top:1px solid #eee" />
    <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>ShopTown LCC</p>
      <p>Most trusted online shopping App</p>
    </div>
  </div>
</div>''';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      Fluttertoast.showToast(msg: 'Email not sent');
    }
  }

  generateRandomNumber() {
    var random = new Random();
    int a = (random.nextInt(9000) + 9000);
    setState(() {
      number = a;
    });
  }
}
