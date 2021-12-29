import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF505050),
        title: Text("About Developer", style: TextStyle()),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset('images/Pastel Pink Simple Graphic Design Resume.png',fit: BoxFit.fill,),
          ),
        ),
    );
  }
}
