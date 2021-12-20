import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/favourite.dart';
import 'package:onlineshopping/main.dart';
import 'package:onlineshopping/order.dart';
import 'package:onlineshopping/profile.dart';

import 'productlist.dart';

class DrawerS extends StatelessWidget {
  const DrawerS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;

    const drawerHeader=UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green
      ),
        accountName: Text('Shopnil Sohan'),
        accountEmail: Text('mehedihasansohan527@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.camera,color: Colors.black,),
      ),
    );
    Divider(
      thickness: 5,
      height: 2,
      color: Colors.black,
    );
    final drawerItems=ListView(
      children: [
        drawerHeader,
        ListTile(
          leading: Icon (Icons.home,size: sohan/28,color: Colors.black),
          title: Text ("Home",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Myhome()));

          },
        ),
      ListTile(
        leading: Icon (Icons.account_circle_sharp,size: sohan/28,color: Colors.black),
        title: Text ("Edit Profile",style: GoogleFonts.ubuntu(textStyle: TextStyle(
            fontSize: sohan/45,color: Colors.black
        ),),
      ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));

          },
        ),
        ListTile(
          leading: Icon (Icons.favorite_border_outlined,size: sohan/28,color: Colors.black),
          title: Text ("Favourite",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
          },
        ),
        ListTile(
          leading: Icon (Icons.history,size: sohan/28,color: Colors.black),
          title: Text ("Order History",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Order()));
          },
        ),
        ListTile(
          leading: Icon (Icons.shop,size: sohan/28,color: Colors.black),
          title: Text ("Product List",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Prolist()));
          },
        ),
        ListTile(
          leading: Icon (Icons.add_shopping_cart,size: sohan/28,color: Colors.black),
          title: Text ("Your Cart",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Order()));
          },
        ),

      ],
    );
    return Drawer(
        backgroundColor: Colors.green,
        child: drawerItems,

    );
  }
}