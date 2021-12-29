import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';
import 'invoices.dart';
import 'multiplechoice.dart';

class DetailsP extends StatefulWidget {
  final Productlistmodel prodetails;
  DetailsP(this.prodetails);

  @override
  _DetailsPState createState() => _DetailsPState();
}

class _DetailsPState extends State<DetailsP> {
  bool favoritecolor = true;
  bool sizecolor = true;
  bool button_color = true;

  int counter = 1;

  getbuttonvalue() {}

  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 320,
            child: Card(
              shadowColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Image.network(
                  widget.prodetails.imageurl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 5),

            child: Row(
              children: [
                Text(
                  "৳" + widget.prodetails.price.toString(),
                  style: TextStyle(
                      fontSize: sohan/ 26,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: sohan1 / 2),
                Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: IconButton(
                      icon: favoritecolor == true
                          ? Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: 30,
                      )
                          : Icon(
                        Icons.favorite,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          favoritecolor = !favoritecolor;
                        });
                      }),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  iconSize: sohan / 27,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15,top:5,bottom: 5 ,right: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                      itemSize: 25,
                      maxRating: 1,
                      itemBuilder:
                      (context,_)=>Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {}),
                  Text('In Stock:  ${widget.prodetails.quantity}',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(color: Colors.deepOrange,fontSize: sohan* .02),
                    ),),
                ],
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(widget.prodetails.title,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(color: Colors.black,fontSize: sohan* .03),
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('Quantity :',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(color: Colors.black,fontSize: 22),
                  ),),
                Container(
                  decoration:BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                  ) ,

                  height: 50,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (counter > 1) {
                              counter--;
                            }
                          });
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22),
                        ),
                      ),
                     Text('|',style: TextStyle(
                       color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                     ),),
                      Text(
                        '$counter',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25),
                      ),
                      Text('|',style: TextStyle(
                          color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                      ),),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (counter < 10) {
                              counter++;
                            }
                          });
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Size :',
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(color: Colors.black,fontSize: sohan* .03),
                  ),),
                  ChoiceRow()
              ],
            ),
          ),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 10),
        child: Text(
          'Description: ${widget.prodetails.description}',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(color: Colors.black,fontSize: sohan* .025),
          ),
        ),
      ),
      ]
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Colors.black))),
        child: SizedBox(
          height: 60,
          child: Material(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            elevation: 25,
            color: Colors.white,
           child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: sohan / 9,
                width: sohan1 / 5,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                invoice(widget.prodetails, counter)));
                  },
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            ),
          ),
        ),
    );
  }
}
