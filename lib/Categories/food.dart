import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/productdetails.dart';
import 'package:onlineshopping/customwidget/productlistmodel.dart';
import 'package:onlineshopping/dashboard.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

final List<Productlistmodel> ProductlistModel = [
  Productlistmodel('F31011','Burger','very tasy', 110, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501507-8162f6ba-f418-4613-9ca7-fe57f5bcd687.png'),
  Productlistmodel('F31011','Fried Chicken','very tasy', 110, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501548-833a51c3-3137-4de0-8c8b-49bc4627d6b7.png'),
  Productlistmodel('F31011','Fried Chicken','very tasy', 210, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501563-e3880a0b-5a43-48fa-9f44-4bdce9d1e20d.png'),
  Productlistmodel('F31011','Vegetables Salad','very tasy', 110, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501580-a5ac5f47-5f58-4e3c-b378-68911dade097.png'),
  Productlistmodel('F31011','Pineaples','very tasy', 50, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501627-13304a55-50cf-4b63-95e3-eda8edc19732.png'),
  Productlistmodel('F31011','Strawberries','very tasy', 150, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501649-be8d0bcc-0ca9-4d0a-9104-d67ad662ca77.png'),
  Productlistmodel('F31011','Green peppers','very tasy', 90, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501674-18ddaf0c-d04a-467e-a5f1-8c7c85a7a958.png'),
  Productlistmodel('F31011','Orange','very tasy', 140, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501726-f8377d08-3c0d-4bb4-b97e-662fa3de4f42.png'),
  Productlistmodel('F31011','Water Melon','very tasy', 210, 5, 1, 1, 'https://user-images.githubusercontent.com/95240967/147501699-7260b5bd-8785-4888-8e45-4658d44efff7.png'),




];

class _FoodState extends State<Food> {
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
