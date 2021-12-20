import 'package:flutter/material.dart';


class VariantRow extends StatefulWidget {
  @override
  _VariantRowState createState() => _VariantRowState();
}

class _VariantRowState extends State<VariantRow> {

  List<bool> isPressedList = [false,false,false,false];

  String classChoice = '';

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 30),
          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = true;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
              });
            },
            child: Button(
              isPressed: isPressedList[0],
              label: 'Yellow',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = true;
                isPressedList[2] = false;
                isPressedList[3] = false;
              });
            },
            child: Button(
              isPressed: isPressedList[1],
              label: 'Red',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = true;
                isPressedList[3] = false;
              });
            },
            child: Button(
              isPressed: isPressedList[2],
              label: 'White',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              setState(() {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = true;
              });
            },
            child: Button(
              isPressed: isPressedList[3],
              label: 'Black',
            ),
          ),
        ],
      );


  }
}

class Button extends StatelessWidget {

  final String? label;
  final bool? isPressed;

  Button({this.label,this.isPressed});


  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Container(
      height:sohan/ 18,
      width: sohan1/8,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(30),
        color: isPressed! ? Colors.green : Colors.cyanAccent,
      ),
      child: Center(
        child: Text(
          label!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isPressed! ? Colors.white : Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}