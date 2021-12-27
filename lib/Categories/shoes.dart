
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productdetails.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';
import 'package:onlineshopping/dashboard.dart';

class Shoes extends StatefulWidget {
  const Shoes({Key? key}) : super(key: key);

  @override
  _ShoesState createState() => _ShoesState();
}

final List<Productlistmodel> ProductlistModel = [
  Productlistmodel('S2113', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493575-470b3fd6-518e-4491-acad-e9806d87065e.png'),
  Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493777-e2431047-49ce-43e9-a2aa-52f10f081e02.png'),
  Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493802-0446dc53-b847-47a5-a457-553fe32d716b.png'),
  Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493831-0b347207-7abe-4eac-8a36-2509b013b763.png'),
];

class _ShoesState extends State<Shoes> {
  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Fashion",
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
                                  RatingBarIndicator(
                                    rating: 3.5,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
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
