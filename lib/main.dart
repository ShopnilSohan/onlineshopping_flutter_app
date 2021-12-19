import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshopping/splash.dart';
void main(){
  runApp(ShopTown());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}
class ShopTown extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
