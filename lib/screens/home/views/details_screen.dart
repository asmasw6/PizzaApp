import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/macro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;

  const DetailsScreen(this.pizza,{super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth= MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      log(">>>>>> screenHeight "+screenHeight.toString());
      log(">>>>>> screenWidth "+screenWidth.toString());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight /2.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 5,
                        color: Colors.grey),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      pizza.picture,
                    ),
                  )),
            ),
            SizedBox(
              height: screenHeight * .022,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(3, 3), blurRadius: 5, color: Colors.grey),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Expanded(
                          flex: 2,
                          child: Text(
                           pizza.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "💰${pizza.price - (pizza.price * (pizza.discount) / 100.00)}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                 Text(
                                  "\$ ${pizza.price}.00",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * .02,
                    ),
                     Row(
                      children: [
                        MyMacroWidget(
                          Title: "Cal.",
                          value: pizza.macros.calories,
                          icon: FontAwesomeIcons.fire,
                        ),
                         SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        MyMacroWidget(
                          Title: "Protein",
                          value: pizza.macros.proteins,
                          icon: FontAwesomeIcons.dumbbell,
                        ),
                         SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        MyMacroWidget(
                          Title: "Fat",
                          value: pizza.macros.fats,
                          icon: FontAwesomeIcons.oilWell,
                        ),
                         SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        MyMacroWidget(
                          Title: "Carbs",
                          value: pizza.macros.carbs,
                          icon: FontAwesomeIcons.breadSlice,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
