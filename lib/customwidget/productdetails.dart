import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';
import 'invoices.dart';
import 'multiplechoice.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 20),
                child: Image.network(widget.prodetails.imageurl,fit: BoxFit.fill,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.prodetails.title,
                  style: TextStyle(fontSize: 25),
                ),
                RatingBarIndicator(
                  rating: 3.5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child: Text(
              'Product Id : ${widget.prodetails.id}',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Price: \৳${widget.prodetails.price}',
                style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Description: ${widget.prodetails.description}',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
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
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(right: 8.0, left: 8.0),
                child: IconButton(
                    icon: favoritecolor == true
                        ? Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 30,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                    onPressed: () {
                      setState(() {
                        favoritecolor = !favoritecolor;
                      });
                    }),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1.5,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    icon: Icon(Icons.chat, color: Colors.black),
                    onPressed: () {}),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: sohan / 9,
                  width: sohan1 / 2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                  child: TextButton(
                    onPressed: () {
                      showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) =>StatefulBuilder(builder: (BuildContext context, StateSetter setState){
                            return  SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: Container(
                                  height: sohan / 2.2,
                                  width: sohan1 / 1.01,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Add to Cart',
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('X',
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.black54,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Quantity',
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),

                                            //counters()
                                            SizedBox(
                                              height: 60,
                                              child: Flexible(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
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
                                                    Text(
                                                      '|',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.black54),
                                                    ),
                                                    Text(
                                                      '$counter',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 25),
                                                    ),
                                                    Text(
                                                      '|',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors.black54),
                                                    ),
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
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Size :',
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            ChoiceRow(),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              height: sohan / 18,
                                              width: sohan1 / 3,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                  BorderRadius.circular(20)),
                                              child: TextButton(
                                                  child: Text('Order',
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black,
                                                          ))),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                invoice(
                                                                    widget
                                                                        .prodetails,
                                                                    counter)));
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          })
                      );

                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
