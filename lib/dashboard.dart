import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:onlineshopping/Categories/bag.dart';
import 'package:onlineshopping/Categories/fashion.dart';
import 'package:onlineshopping/Categories/shoes.dart';
import 'package:onlineshopping/customwidget/Custom.dart';
import 'package:onlineshopping/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Categories/food.dart';
import 'customwidget/drawer.dart';
import 'customwidget/productdetails.dart';
import 'customwidget/productlistmodel.dart';
import 'favourite.dart';
import 'main.dart';
import 'order.dart';

class Mydashboard extends StatefulWidget {


  @override
  _MydashboardState createState() => _MydashboardState();
}

TextEditingController firstnameController = TextEditingController();
TextEditingController emailController = TextEditingController();

bool favoritecolor = true;
final imagelist = [
  'images/offer2.png',
  'images/offer3.png',
  'images/offer4.png'
];
final List<Productlistmodel> ProductlistModel = [
  Productlistmodel(
      '2002',
      'Yellow T-Shirt',
      'Yellow Shirt 100 % Linen with yellow details on the sleeves and neck. Casual design shirt for men without losing the elegance for the garment.',
      350,
      5,
      2,
      10,
      'https://user-images.githubusercontent.com/95240967/145766298-7e81d22d-19f4-45dd-a3be-4f7f77de09d6.png'),
  Productlistmodel(
      2001,
      'Smiley T shirt',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493987-f723baca-2b45-4970-a7c6-e96d2228d02f.png'),
  Productlistmodel(2433,"Red t-shirt","A T-shirt is the most versatile piece of clothing you can own.", 550,15,2, 2, "https://user-images.githubusercontent.com/95240967/147493956-e3ff7393-d69b-449a-8c89-cf4d3605cbb6.png"),
  Productlistmodel(
      2001,
      'Sweater',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493968-95d2b2bd-7bfd-4a41-95df-6c51a606d20d.png'),
  Productlistmodel(
      2001,
      'Sweater',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493839-00dc24aa-80e1-4975-b91f-066f7fd3b427.png'),
  Productlistmodel(
      2001,
      'Sweater',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493846-f054c6b9-86fb-4535-8dcb-4539f43546a9.png'),
  Productlistmodel(
      2001,
      'Sweater',
      'A T-shirt is the most versatile piece of clothing you can own. Not only are T-shirts used on a daily basis, but they are also usually the best option for a laid back and casual day at the office. If you’re considering buying a T-shirt, make sure to go through the following list of excellent choices.',
      490,
      10,
      2,
      2,
      'https://user-images.githubusercontent.com/95240967/147493541-c382443f-c86d-4736-aa80-078e37e8da1c.jpg'),
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
  Productlistmodel('S2113', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493575-470b3fd6-518e-4491-acad-e9806d87065e.png'),
  Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493777-e2431047-49ce-43e9-a2aa-52f10f081e02.png'),
  Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493802-0446dc53-b847-47a5-a457-553fe32d716b.png'),
  Productlistmodel('S2114', 'Black Shoe', 'its a very stylish dashing shoe',2150, 15, 2, 2, 'https://user-images.githubusercontent.com/95240967/147493831-0b347207-7abe-4eac-8a36-2509b013b763.png'),




];

class _MydashboardState extends State<Mydashboard> {
  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.green),
      accountName: Text('Shopnil Sohan'),
      accountEmail: Text('mehedihasansohan527@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.camera,
          color: Colors.black,
        ),
      ),
    );
    Divider(
      thickness: 5,
      height: 2,
      color: Colors.black,
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Myhome()));
          },
        ),
        ListTile(
          title: Text('My Profile'),
          leading: Icon(Icons.account_box),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
        ),
        ListTile(
          title: Text('Favourite'),
          leading: Icon(Icons.account_box),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Favourite()));
          },
        ),
        ListTile(
          title: Text('Order List'),
          leading: Icon(Icons.add_shopping_cart_outlined),
          onTap: () {},
        ),
        ListTile(
          title: Text('Order History'),
          leading: Icon(Icons.logout),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Order()));
          },
        ),
      ],
    );

    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const DrawerS(
      ),
      appBar: AppBar(
        title: Text('ShopTown',
          style: GoogleFonts.ubuntu(
            textStyle:
            const TextStyle(fontSize: 25, color: Colors.black),
          ),),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintStyle: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                    hintText: 'Search Your Product'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
              child: SizedBox(
                height: 160,
                child: CarouselSlider.builder(
                  slideBuilder: (index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(imagelist[index]),
                              fit: BoxFit.fill)),
                    );
                  },
                  slideTransform: StackTransform(),
                  slideIndicator: CircularSlideIndicator(
                      padding: const EdgeInsets.only(bottom: 10)),
                  autoSliderDelay: Duration(seconds: 4),
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  itemCount: imagelist.length,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Categories',
                      style: GoogleFonts.ubuntu(
                        textStyle:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Food()));
                          },
                            child: custom_widget('images/food.png', 'Food')),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Fashion()));
                            },
                            child: custom_widget('images/fashion.png', 'Fashion')),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Bag()));
                            },
                            child: custom_widget('images/bag.png', 'Bag')),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Shoes()));
                            },
                            child: custom_widget('images/shoes.png', 'Shoes')),
                        custom_widget('images/men.png', 'Men'),
                        custom_widget('images/womwn.png', 'Women'),
                        custom_widget('images/kids.png', 'kids'),
                        custom_widget('images/jewellery.png', 'jewellery'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: GoogleFonts.ubuntu(
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  TextButton(
                    child: Text(
                      'See all',
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                              color: Colors.green, fontSize: 20)),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
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
                                    "\৳${ProductlistModel[index].price * ProductlistModel[index].discount / 100}",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2.85,
                                    )),
                                  ),
                                  Text(
                                    "\৳${ProductlistModel[index].price - ProductlistModel[index].price * ProductlistModel[index].discount / 100}",
                                    style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                            color: Colors.black, fontSize: 25)),
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
