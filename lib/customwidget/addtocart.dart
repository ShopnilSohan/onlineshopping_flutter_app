
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/invoices.dart';
import 'package:onlineshopping/customwidget/multiplechoice.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';

class AddCart extends StatefulWidget {

  @override
  _AddCartState createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Container(
      height: sohan / 2.8,
      width: sohan1 / 1.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add to Cart',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'X',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                              fontSize: 35, color: Colors.black54),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '$counter',
                            style: TextStyle(
                                color: Colors.black, fontSize: 25),
                          ),
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                              fontSize: 35, color: Colors.black54),
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
                                color: Colors.black, fontSize: 25),
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
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,),
                  ),
                ),
                ChoiceRow(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: sohan/20,
                  width: sohan1/3,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                      child: Text('Checkout',style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                        )
                      )),

                      onPressed: (){
                       //Navigator.push(context,MaterialPageRoute(builder: (context)=>invoice()));
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
