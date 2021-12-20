

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productdetails.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';


class Prolist extends StatefulWidget {
  @override
  _ProlistState createState() => _ProlistState();
}

class _ProlistState extends State<Prolist> {
  final List<Productlistmodel> ProductlistModel = [
    Productlistmodel(
        'TY1001',
        'Yellow T-Shirt',
        'Yellow Shirt 100 % Linen with yellow details on the sleeves and neck. Casual design shirt for men without losing the elegance for the garment.',
        99,
        10,
        2,
        10,
        'https://user-images.githubusercontent.com/95240967/145766298-7e81d22d-19f4-45dd-a3be-4f7f77de09d6.png'),
    Productlistmodel(2001, 'Smiley T shirt', 'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.', 490, 10, 2, 2, 'https://hantechdesign.com/admin/bin/Item_Images/1235-1.jpg'),
    Productlistmodel('101', 'TOMATO', '', 99, 10, 2, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYVU-GFStOSmXTIp1pnOnNvR2ykxp-DY1a4w&usqp=CAU'),
    Productlistmodel('101', 'LEMON', 'বাদাম খান আর গান গান', 99, 10, 2, 10, 'https://thekitchencommunity.org/wp-content/uploads/2020/12/Are-limes-unripe-lemons-1200x900.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: ProductlistModel.length,
          itemBuilder: (context, i) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsP(ProductlistModel[i])));
                },
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                NetworkImage(ProductlistModel[i].imageurl),
                                fit: BoxFit.fill),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              ProductlistModel[i].title,maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(color: Colors.black, fontSize: 25)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("\৳${ProductlistModel[i].price}",
                                  style: TextStyle(fontSize: 25,),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "\৳${ProductlistModel[i].price}",
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.85,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  height: 120,
                ),
              ),
            );
          }),
    );
  }
}
