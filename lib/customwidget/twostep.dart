
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';


class TwoStep extends StatefulWidget {
  const TwoStep({Key? key}) : super(key: key);

  @override
  _TwoStepState createState() => _TwoStepState();
}

class _TwoStepState extends State<TwoStep> {
  @override
  void initState() {
    generateRandomNumber();
  }
  @override
  int number =0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: (
              ){
            mail ();

          }, child: Text('Two Step'))
        ],
      ),
    );
  }

  Future mail ()async {
    final smtpServer = gmail('shopnilsohan01@gmail.com', 'sohan2011s');
    final message = Message()
      ..from = Address('shopnilsohan01@gmail.com','Shopnil Sohan')
      ..recipients.add('mehedihasansohan527@gmail.com')
      ..subject = 'Otp verification'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = '''<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
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
    int a = (random.nextInt(90000) + 90000);
    setState(() {
      number = a;
    });
  }

}
