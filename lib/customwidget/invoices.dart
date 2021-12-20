
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';

class invoice extends StatefulWidget {
 Productlistmodel Prodetails;
 int counter;

  invoice(this.Prodetails, this.counter);

  @override
  _invoiceState createState() => _invoiceState();
}

class _invoiceState extends State<invoice> {
  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: sohan/1.5,
            width: sohan1/1.02,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Card(
              elevation: 20,
              child: Column(
                children: [
                  Text(
                    'Billing Summary',
                    style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Order No: ${widget.Prodetails.id}',
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\৳${widget.Prodetails.price * widget.counter}',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\৳${widget.Prodetails.price * widget.counter * widget.Prodetails.discount / 100}',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Charge',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '৳Free',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Total',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\৳${(widget.Prodetails.price * widget.counter) - (widget.Prodetails.price *widget.Prodetails.discount * widget.counter / 100)}',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: TextField(
                      style: const TextStyle(color: Colors.black, height: 4),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Order Comment',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Type here....'),
                    ),
                  ),
                ],
              ),
            ),

          )

        ],
      ),

    );
  }
}
