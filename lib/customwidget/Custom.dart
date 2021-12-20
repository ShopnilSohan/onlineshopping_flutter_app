
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custom_widget extends StatelessWidget {

  late String image;
  late String text;
  custom_widget(String image, text){
    this.image=image;
    this.text=text;
  }

  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return  Container(
      height: sohan/6.5,
      width: sohan1/4,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Container(
              height: sohan*0.1,
              width: sohan1*.2,
              child: Image.asset(image,fit: BoxFit.cover,),
            ),
            Divider(
              height: 8,
            ),
            Text(text, style: GoogleFonts.ubuntu(
              textStyle: TextStyle(color: Colors.black,fontSize: sohan* .02),
            ),)
          ],
        ),
      ),
    );
  }
}
