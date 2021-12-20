import 'package:flutter/material.dart';


class ChoiceRow extends StatefulWidget {
  @override
  _ChoiceRowState createState() => _ChoiceRowState();
}

class _ChoiceRowState extends State<ChoiceRow> {

  List<bool> isPressedList = [false,false,false,false];

  String classChoice = '';

  @override
  Widget build(BuildContext context) {

    print("Status L $isPressedList");

    return

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 30),
          GestureDetector(
            onTap: (){
              print("Hello");
              setState(() {
                isPressedList[0] = true;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
              });
            },
            child: ChoiceButton(
              isPressed: isPressedList[0],
              label: 'M',
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
            child: ChoiceButton(
              isPressed: isPressedList[1],
              label: 'L',
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
            child: ChoiceButton(
              isPressed: isPressedList[2],
              label: 'XL',
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
            child: ChoiceButton(
              isPressed: isPressedList[3],
              label: 'XXL',
            ),
          ),
        ],
      );


  }
}

class ChoiceButton extends StatelessWidget {

  final String? label;
  final bool? isPressed;

  ChoiceButton({this.label,this.isPressed});


  @override
  Widget build(BuildContext context) {
    var sohan = MediaQuery.of(context).size.height;
    var sohan1 = MediaQuery.of(context).size.width;
    return Container(
      height:sohan/ 20,
      width: sohan1/8,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(30),
        color: isPressed! ? Colors.green : Colors.black,
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