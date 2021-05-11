import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class CustomBtn extends StatelessWidget {
  String providerName;
  IconData iconData;
  Color color;
  Function f;
  CustomBtn({this.providerName, this.iconData, this.color,this.f});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.all(20),
      child: OutlineButton.icon(
        onPressed: f,
        icon: FaIcon(iconData,
          color:color,

        ),
        label: Text("SignIn with $providerName",
          style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        highlightedBorderColor: color,
        textColor: Colors.black,
        borderSide: BorderSide(color: color),

        shape: StadiumBorder(),),

    );
  }
}
