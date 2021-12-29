

import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network('https://user-images.githubusercontent.com/95240967/147699379-d09a6b42-d048-476b-b03f-c958acbd4ff9.png',fit: BoxFit.fill,),
    );
  }
}
