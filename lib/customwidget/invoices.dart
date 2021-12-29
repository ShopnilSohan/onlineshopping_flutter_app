
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';
import 'package:onlineshopping/main.dart';

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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sohan/1.1,
              width: sohan1/1.02,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Billing Summary',
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Container(
                          height: sohan/6,
                          width: sohan1/3,
                          child: Card(
                            elevation: 20,
                            child: Image.network(widget.Prodetails.imageurl,fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order No :',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${widget.Prodetails.id}',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Name :',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${widget.Prodetails.title}',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),SizedBox(
                        height: 10,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity:',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${widget.counter}',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18,
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
                            'Size',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'L',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black54,
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
                        color: Colors.black54,
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: const TextStyle(color: Colors.black, height: 1),
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
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Card(
                          elevation: 20,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),

                        ),
                          child: TextButton(onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: Container(
                                    height: sohan/1.65,
                                    width: sohan1/1.01,
                                    child: Column(
                                      children: [
                                        Container(
                                         height: sohan/3.70,
                                          child: Image.asset('images/order.png',fit: BoxFit.fill,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Center(
                                            child: Text(
                                              'Order Placed Successfully!',
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(fontSize: 20, color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12),
                                          child: Center(
                                              child: Text(
                                                  'Congratulations! Your order has been placed',
                                                  style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(fontSize: 13.5, color: Colors.black),
                                                  ))),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12),
                                          child: Center(
                                              child: Text(
                                            'You can track your order number \#${widget.Prodetails.id}',
                                            style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(fontSize: 14, color: Colors.black),
                                            ))),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: (Colors.green),
                                                      fixedSize: Size(120, 25),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30))),

                                                  onPressed: (){},
                                                  child: Text(
                                                      'Track Order',
                                                      style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(fontSize: 15, color: Colors.black),
                                                      ))),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: (Colors.green),
                                                      fixedSize: Size(150, 35),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30))),

                                                  onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Myhome()));
                                                  },
                                                  child: Text(
                                                      'Continue Shopping',
                                                      style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(fontSize: sohan1/35, color: Colors.black),
                                                      ))),
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                )
                            );
                          }, child:Text('Place Order',style: GoogleFonts.spectral(
                              textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,))),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            )

          ],
        ),
      ),

    );
  }
}
