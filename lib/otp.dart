
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/forgetpass.dart';
import 'package:onlineshopping/passentry.dart';

import 'package:otp_pin_field/otp_pin_field.dart';

class Otps extends StatefulWidget {
  String number;
  @override
  _OtpsState createState() => _OtpsState();

  Otps(this.number);


}

class _OtpsState extends State<Otps> {
  String otp="2334444444444444444";
  @override
  Widget build(BuildContext context) {
   String a = widget.number;
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Otp Verification',
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
              'Otp Verification',
              style: GoogleFonts.ubuntu(
                textStyle:TextStyle(fontSize: 35, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 30,bottom: 20),
            child: Center(
                child: Text(
                  'Otp code has been sent to you on your\n            email please enter it below',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: OtpPinField(

              otpPinFieldInputType: OtpPinFieldInputType.none,
           // otpPinInputCustom: ,
              onSubmit: (text) {
                setState(() {
                  otp= text;
                });
              },
              otpPinFieldStyle: OtpPinFieldStyle(


                defaultFieldBorderColor: Colors.black,
                activeFieldBorderColor: Colors.red, //
                defaultFieldBackgroundColor: Colors.green,
                activeFieldBackgroundColor: Colors.white54,
              ),
              maxLength: 5,
              highlightBorder: true,
              fieldWidth: sohan1/8,
              fieldHeight: sohan/12,
              keyboardType: TextInputType.text,
              autoFocus: false,
              otpPinFieldDecoration:
              OtpPinFieldDecoration.defaultPinBoxDecoration,
            ),
          ),
          Container(
            width: sohan1 / 1,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '''Don't receive the OTP? ''',
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                ),
                children: [
                  TextSpan(
                      text: 'Resend',
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgetpass()));
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: (Colors.green),
                fixedSize: Size(320, 65),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30))),
            onPressed: () {
              if(a==otp){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PassEntry()));
              }
              else {
                Fluttertoast.showToast(msg: "Wrong Otp");
              }

            },
            child: Text(
              'Verify',
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                    fontSize: 29, color: Colors.black),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
