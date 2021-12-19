

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';


class Mydashboard extends StatefulWidget {
  const Mydashboard({Key? key}) : super(key: key);

  @override
  _MydashboardState createState() => _MydashboardState();
}
int _selectnavigationbar=1;
final imagelist=[
  'images/offer2.png',
  'images/offer3.png',
  'images/offer4.png'
];

class _MydashboardState extends State<Mydashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(

      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ShopTown'),
        backgroundColor: const Color(0XFFff781f),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton( onPressed: () {  }, icon:  const Icon(Icons.notifications_outlined,color: Colors.black,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton( onPressed: () {  }, icon:  const Icon(Icons.shopping_cart_outlined,color: Colors.black,)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search_outlined,color: Colors.black,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          color: Colors.black),
                    ),
                    hintText:
                    'Search Your Product'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 8,left: 8),
              child: SizedBox(
                height: 180,
                child: CarouselSlider.builder(
                  slideBuilder:(index){
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(

                              image: AssetImage(imagelist[index]),
                              fit: BoxFit.fill

                          )
                      ),
                    );
                  },
                  slideTransform: StackTransform(),
                  slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.only(bottom: 10)
                  ),
                  autoSliderDelay: Duration(seconds: 5),
                  enableAutoSlider: true,
                  unlimitedMode: true,

                  itemCount: imagelist.length,

                ),
              ),
            ),
            Container(
              child: Row(

              ),
            ),

          ],
        ),


      )
    );
  }
}
