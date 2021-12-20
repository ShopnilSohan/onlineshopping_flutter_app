
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? imageFile;
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:60),
              child: Column(
                children: [
                  Container(
                    height: sohan/7.5,
                    color:Colors.green,
                  ),
                  Container(
                    height:sohan/1.31,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight:  Radius.circular(35),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20,top:20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text ('Shopnil Sohan',style: GoogleFonts.ubuntu (textStyle:TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: sohan/40,color: Colors.black
                                      ),),),
                                      Text ('mehedihasan@gmail.com',style: GoogleFonts.ubuntu (textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,color: Colors.black54,
                                          fontSize: sohan/45
                                      ),),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: sohan/55),
                        const Divider(
                          thickness: 0.1,
                          color: Color(0xFF505050),
                        ),
                        TextButton(onPressed: (){},
                          child: ListTile(
                            leading: Icon (Icons.account_circle_sharp,size: sohan/23,color: Colors.black),
                            trailing:  Icon (Icons.arrow_forward_ios_outlined ,size: sohan/30,color: Colors.black),
                            title: Text ("Edit Profile",style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              fontSize: sohan/45,color: Colors.black
                            )),),
                          ),
                        ),
                        TextButton(onPressed: (){},
                          child: ListTile(
                            leading: Icon (Icons.location_on_outlined,size: sohan/23,color: Colors.black),
                            trailing:  Icon (Icons.arrow_forward_ios_outlined ,size: sohan/30,color: Colors.black),
                            title: Text ("Shopping Address",style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              fontSize: sohan/45,color: Colors.black,
                            )),),
                          ),
                        ),
                        TextButton(onPressed: (){},
                          child: ListTile(
                            leading: Icon (Icons.shopping_bag,size: sohan/23,color: Colors.black),
                            trailing:  Icon (Icons.arrow_forward_ios_outlined ,size: sohan/30,color: Colors.black),
                            title: Text ("Order History",style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              fontSize: sohan/45,color: Colors.black
                            )),),
                          ),
                        ),
                        TextButton(onPressed: (){},
                          child: ListTile(
                            leading: Icon ( Icons.notification_important_sharp,size: sohan/23,color: Colors.black),
                            trailing:  Icon (Icons.arrow_forward_ios_outlined ,size: sohan/30,color: Colors.black),
                            title: Text ("Notifications",style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              fontSize: sohan/45,color: Colors.black
                            )),),
                          ),
                        ),
                        TextButton(onPressed: (){},
                          child: ListTile(
                            leading: Icon (Icons.label_important_rounded,size: sohan/23,color: Colors.black),
                            trailing:  Icon (Icons.arrow_forward_ios_outlined ,size: sohan/30,color: Colors.black),
                            title: Text ("About",style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              fontSize: sohan/45,color: Colors.black
                            )),),
                          ),
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MySigin()));
                        },
                          child: ListTile(
                            leading: Icon (Icons.login_outlined,size: sohan/23,color: Colors.black),
                            trailing:  Icon (Icons.arrow_forward_ios_outlined ,size: sohan/30,color: Colors.black),
                            title: Text ("Logout",style: GoogleFonts.ubuntu(textStyle: TextStyle(
                              fontSize: sohan/45,color: Colors.black
                            )),),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: sohan/ 10,
              left: 5,
              right: 5,
              child: Center(
                child: CircleAvatar(
                  radius: 65,
                  child: displaySignatureFile(),
                ),
              ),
            ),
            Center(
              child: TextButton(onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          height: 100,
                          child: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    _getFromcamera();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Camera")),
                              TextButton(
                                  onPressed: () {
                                    _getFromGallery();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Gallery"))
                            ],
                          ),
                        ),
                      );
                    });},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,top: 185),
                    child: Icon(Icons.camera_alt,color: Colors.black,size: 30,),
                  ),
            ),
            )
          ],
        ),
      ),

    );




  }
  getSharedPref() async {}

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromcamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget displaySignatureFile() {
    return SizedBox(
      height: 200,
      width: 200,
      child: imageFile == null
          ? Icon(Icons.camera_alt, size: 50)
          : ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.file(imageFile!, fit: BoxFit.fill),
      ),
    );
  }
}
