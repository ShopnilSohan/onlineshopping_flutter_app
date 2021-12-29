import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productdetails.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';
import 'package:onlineshopping/dashboard.dart';


class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  _BagState createState() => _BagState();
}

final List<Productlistmodel> ProductlistModel = [
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
  Productlistmodel(
      2001,
      'Bag',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493940-871ffb0a-e004-4ed9-8b3d-cab1ae1a27df.png'),
  Productlistmodel(
      2001,
      'Bag',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493897-3e7631c1-d1d0-47bd-a7ca-b952320a9117.png'),
];


class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Stylish Bag",
          style: GoogleFonts.ubuntu(
              textStyle:
              const TextStyle(color: Colors.black, fontSize: 20)),)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  controller: new ScrollController(keepScrollOffset: true),
                  itemCount: ProductlistModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1.5 / 2),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsP(
                                  ProductlistModel[index],
                                )));
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 20,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      height: sohan / 26,
                                      width: sohan1 / 6.5,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              bottomRight:
                                              Radius.circular(40))),
                                      child: Center(
                                          child: Text(
                                              '${ProductlistModel[index].discount}%',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: IconButton(
                                        icon: Icon(Icons.favorite,
                                            size: 25,
                                            color: favoritecolor == true
                                                ? Colors.black
                                                : Colors.deepOrange),
                                        onPressed: () {
                                          setState(() {
                                            favoritecolor = !favoritecolor;
                                          });
                                        }),
                                  )
                                ],
                              ),
                              Container(
                                height: sohan / 9,
                                child: Image.network(
                                  ProductlistModel[index].imageurl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                ProductlistModel[index].title,
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "\৳${ProductlistModel[index].price - ProductlistModel[index].price * ProductlistModel[index].discount / 100}",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                            color: Colors.black, fontSize: 25)),
                                  ),
                                  Text(
                                    "\৳${ProductlistModel[index].price * ProductlistModel[index].discount / 100}",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          decoration: TextDecoration.lineThrough,
                                          decorationThickness: 1.5,
                                        )),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  RatingBar.builder(
                                      itemSize: 25,
                                      maxRating: 1,
                                      itemBuilder: (context ,_)=>Icon(Icons.star,color: Colors.amber,size: 5,) ,
                                      onRatingUpdate: (rating){}),
                                  Text(
                                    '''[3.5]''',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  }),
            )
          ],
        ),
      ),

    );
  }
}
