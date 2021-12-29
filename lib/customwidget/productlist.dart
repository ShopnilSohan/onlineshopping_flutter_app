

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
    Productlistmodel('S2113', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493575-470b3fd6-518e-4491-acad-e9806d87065e.png'),
    Productlistmodel('F31011','Burger','very tasy', 110, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501507-8162f6ba-f418-4613-9ca7-fe57f5bcd687.png'),
    Productlistmodel(
        2001,
        'Sweater',
        'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
        490,
        10,
        2,
        2,
        'https://user-images.githubusercontent.com/95240967/147493877-9048787f-714d-40d6-8a6d-7850e0917c8f.png'),
    Productlistmodel(
        2001,
        'Bag',
        'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
        490,
        10,
        2,
        2,
        'https://user-images.githubusercontent.com/95240967/147493921-dddf915f-0b5e-4fe4-8624-12de62979443.png'),
    Productlistmodel(
        2001,
        'Bag',
        'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
        490,
        10,
        2,
        2,
        'https://user-images.githubusercontent.com/95240967/147493909-a3c13be8-40e7-4655-9e1e-2484a969468b.png'),

    Productlistmodel('F31011','Fried Chicken','very tasy', 110, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501548-833a51c3-3137-4de0-8c8b-49bc4627d6b7.png'),
    Productlistmodel('F31011','Fried Chicken','very tasy', 210, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501563-e3880a0b-5a43-48fa-9f44-4bdce9d1e20d.png'),
    Productlistmodel('F31011','Vegetables Salad','very tasy', 110, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501580-a5ac5f47-5f58-4e3c-b378-68911dade097.png'),
    Productlistmodel('F31011','Pineaples','very tasy', 50, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501627-13304a55-50cf-4b63-95e3-eda8edc19732.png'),
    Productlistmodel('F31011','Strawberries','very tasy', 150, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501649-be8d0bcc-0ca9-4d0a-9104-d67ad662ca77.png'),

    Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493777-e2431047-49ce-43e9-a2aa-52f10f081e02.png'),
    Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493802-0446dc53-b847-47a5-a457-553fe32d716b.png'),

    Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493831-0b347207-7abe-4eac-8a36-2509b013b763.png'),
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
