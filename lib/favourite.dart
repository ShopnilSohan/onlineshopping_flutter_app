
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network('https://user-images.githubusercontent.com/95240967/147699827-4bcb6c68-cebe-4ea7-9d90-c4871d206e6e.png',fit: BoxFit.fill,),
    );

  }
}
