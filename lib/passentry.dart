import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/loginpage.dart';
import 'package:onlineshopping/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassEntry extends StatefulWidget {
  const PassEntry({Key? key}) : super(key: key);

  @override
  State<PassEntry> createState() => _PassEntryState();
}
TextEditingController newpassController = TextEditingController();
TextEditingController retypenewpassController = TextEditingController();
class _PassEntryState extends State<PassEntry> {
  bool hiddenpassword = true;
  String pass = "";
  @override

  getpref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
     pref.setString('pass',newpassController.text);
    });
  }

  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 60),
                child: Text(
                  'Reset Password',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(fontSize: 35, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                    child: Text(
                  'Enter your new password below that you like \n                   Password must be strong',
                  style: GoogleFonts.ubuntu(
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
                ),
              ),
              SizedBox(
                  height: sohan*.2,
                  width: sohan1/1,
                  child: Image.asset('images/pass.png')),

              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: TextField(
                  maxLength: 8,
                  obscureText: hiddenpassword,
                  controller: newpassController,
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
                    labelText: 'New Password',
                    labelStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                    hintText: 'Enter your new password',
                    hintStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: TextField(
                  maxLength: 8,
                  obscureText: hiddenpassword,
                  controller: retypenewpassController,
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
                    labelText: 'Confirm new Password',
                    labelStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                    hintText: 'Confirm your new password',
                    hintStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0XFFff781f),
                      fixedSize: const Size(320, 65),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    if(newpassController.text.isEmpty && retypenewpassController.text.isEmpty) {
                    Fluttertoast.showToast(
                    msg:
                    '''Password Can't be empty''',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR);
                    }
                    else if(
                    newpassController.text==retypenewpassController.text
                    ){
                      getpref();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MySigin()));
                    }

                    else{
                      Fluttertoast.showToast(
                          msg:
                          'Please enter the same password',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR);
                    }
                  },
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(fontSize: 29, color: Colors.black),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
