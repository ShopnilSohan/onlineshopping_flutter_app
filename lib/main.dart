import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshopping/dashboard.dart';
import 'package:onlineshopping/favourite.dart';
import 'package:onlineshopping/order.dart';
import 'package:onlineshopping/profile.dart';
import 'package:onlineshopping/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'customwidget/twostep.dart';
void main(){
  runApp(ShopTown());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class ShopTown extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash(),
    );
  }
}


class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {


  PageController _pageController= PageController();
  List <Widget> pages=[Mydashboard(),Favourite(),Order(),Profile(),];
  int _selectnavigationbar=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children:
        pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home),),
          BottomNavigationBarItem(label: 'Favourite', icon: Icon(Icons.favorite_border_outlined)),
          BottomNavigationBarItem(label: 'Order', icon: Icon(Icons.shopping_bag)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.account_circle_rounded)),

        ],
        backgroundColor:Color(0XFFff781f),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        elevation: 20,
        currentIndex: _selectnavigationbar,
        onTap: (int index){
          _pageController.jumpToPage(index);

        },
      ),
    );
  }

  void onPageChanged(int  value) {
    setState(() {
      _selectnavigationbar=value;
    });
  }
}
