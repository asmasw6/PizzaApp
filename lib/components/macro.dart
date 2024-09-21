import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  final String Title;
  final int value;
  final IconData icon;
  const MyMacroWidget({
    required this.Title,
    required this.icon,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 5,
                color: Colors.grey.shade400,
              ),
            ]),
        child:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              FaIcon(
                icon,
                color: Colors.red,
              ),
              SizedBox(
                height: screenHeight*0.02,
              ),
              Text(
                Title =="Claories"? 
                "${value} ${Title}": "${value}g ${Title}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
