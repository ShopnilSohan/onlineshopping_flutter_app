


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';

import 'addtocart.dart';





class DetailsP extends StatefulWidget {

  final Productlistmodel prodetails;
  DetailsP(this.prodetails);

  @override
  _DetailsPState createState() => _DetailsPState();
}

class _DetailsPState extends State<DetailsP> {
  bool favoritecolor = true;
  bool sizecolor=true;
  bool button_color= true;
  int counter=1;

  getbuttonvalue () {

  }


  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back_outlined),color: Colors.black,),
        actions: [
          IconButton(onPressed: (

              ){},
            icon: Icon(Icons.shopping_cart),color: Colors.black,)
        ],
      ),
      body: ListView(

        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                image: DecorationImage (
                    image: NetworkImage (
                      widget.prodetails.imageurl ,
                    ),fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
            ),
            //child: Image.network(,fit: BoxFit.fill,),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.prodetails.title,style: TextStyle(fontSize: 25),),
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
            padding: const EdgeInsets.only(left: 15,bottom: 5),
            child: Text('Product Id : ${widget.prodetails.id}',style: TextStyle(color: Colors.black,fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text('Price: \৳${widget.prodetails.price}',style: TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 10),
            child: Text('Description: ${widget.prodetails.description}',style: TextStyle(color: Colors.black,fontSize: 20),),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration (
            border: Border (
                top: BorderSide (
                    color: Colors.black
                )
            )
        ),
        child: SizedBox(

            height: 60,
            child: Material(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(10) ),
              elevation: 25,
              color: Colors.white,
              child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.0, left: 8.0),
                      child: IconButton(
                          icon: favoritecolor==true?Icon(Icons.favorite_outline, color:Colors.black,size: 30,):Icon(Icons.favorite, color:Colors.red,size: 30,)
                          ,onPressed: () {
                        setState(() {
                          favoritecolor=!favoritecolor;
                        });
                      }
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(top: 10,bottom: 10),
                        child: VerticalDivider(

                          color: Colors.black,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: IconButton(
                          icon: Icon(Icons.chat, color: Colors.black),
                          onPressed: (){}

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: TextButton(onPressed: () {  },
                          child: Text('Buy',style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),

                      ),
                    ),
                    SizedBox(width: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height:sohan /10,
                        width: sohan1/3.5,

                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: TextButton(onPressed: () {
                          showDialog(context: context, builder: (context){
                            return Dialog(
                              child: AddCart(),

                            );
                          });

                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCart()));
                        },
                          child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 13),),
                        ),

                      ),
                    ),




                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     height:sohan /10,
                    //     width: sohan1/3.5,
                    //
                    //     decoration: BoxDecoration(
                    //         color: Colors.black,
                    //         borderRadius: BorderRadius.circular(16)
                    //     ),
                    //     child: TextButton(onPressed: () {
                    //       showDialog(context: context, builder: (context){
                    //         return Dialog(
                    //             child: Invoice(widget.prodetails,counter),
                    //
                    //         );
                    //       });
                    //
                    //       //Navigator.push(context, MaterialPageRoute(builder: (context)=> Invoice(widget.prodetails,counter)));
                    //     },
                    //       child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 13),),
                    //     ),
                    //
                    //   ),
                    // ),
                  ]
              ),
            )

        ),
      ),


    );

  }


  }


