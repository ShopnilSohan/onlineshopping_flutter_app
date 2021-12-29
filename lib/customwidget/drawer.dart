import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/customwidget/aboutdeveloper.dart';
import 'package:onlineshopping/favourite.dart';
import 'package:onlineshopping/main.dart';
import 'package:onlineshopping/order.dart';
import 'package:onlineshopping/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'productlist.dart';

class DrawerS extends StatefulWidget {
  const DrawerS({Key? key}) : super(key: key);

  @override
  State<DrawerS> createState() => _DrawerSState();
}

class _DrawerSState extends State<DrawerS> {

  String userfname='';
  String userlname='';
  String email='';

  @override

  void initState() {
    getSharedPref();
  }
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;

    var drawerHeader=UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green
      ),
        accountName: Text('$userfname $userlname',style: GoogleFonts.ubuntu(textStyle: TextStyle(
            fontSize: sohan/45,color: Colors.black
        ),),),
        accountEmail: Text('$email',style: GoogleFonts.ubuntu(textStyle: TextStyle(
            fontSize: sohan/45,color: Colors.black
        ),),),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.account_circle_rounded,color: Colors.black,size: 75,),
      ),
    );
    Divider(
      thickness: 5,
      height: 3,
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
          },
        ),
        ListTile(
          leading: Icon (Icons.policy_rounded,size: sohan/28,color: Colors.black),
          title: Text ("Privacy Policy",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
          },
        ),
        ListTile(
          leading: Icon (Icons.add_chart,size: sohan/28,color: Colors.black),
          title: Text ("About Developer",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutMe()));
          },
        ),
        ListTile(
          leading: Icon (Icons.contact_support_rounded,size: sohan/28,color: Colors.black),
          title: Text ("Contact Support",style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
          onTap: (){
          },
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text ('''V 1.0(2)''',style: GoogleFonts.ubuntu(textStyle: TextStyle(
              fontSize: sohan/45,color: Colors.black
          ),),
          ),
        ),

      ],
    );
    return Drawer(
        backgroundColor: Colors.green,
        child: drawerItems,

    );
  }

  getSharedPref() async{
    final pref = await SharedPreferences.getInstance();
    setState(() {
      userfname = pref.getString('userfname')!;
      userlname= pref.getString('userlname')!;
      email=pref.getString('email')!;

    });
  }
}