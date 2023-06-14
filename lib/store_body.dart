import 'package:flutter/material.dart';
import 'dart:ui';
import 'my_theme.dart';

class StoreBody extends StatelessWidget {
  static const String routeName = 'store_body';
  // list of images
  List topOrders =[
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU'),
  ];

  List bestMarkets =[
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          ///first container
          Container(
            decoration: BoxDecoration(
              color: MyTheme.mainColor,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(20),
                bottomStart: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ///circle avatar + welcome text + andna logo
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///profile avatar////////////////////////////////////
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      ///welcome text////////////////////////////////////
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HI, Ahmed!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Welcome to Andna app',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ///andna logo////////////////////////////////////
                      ImageIcon(
                        AssetImage('assets/images/andna_logo_white.png'),
                        size: 45,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ///search bar
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      prefixIcon:  Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color:Colors.white,
                        ),
                      ),
                      hintText: 'Search for any thing...',
                      hintStyle: TextStyle(
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ///Top Orders
          Text(
            'Top Orders',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              shadows: [
                Shadow(
                  blurRadius: 15,  // shadow blur
                  color: Colors.grey, // shadow color
                  offset: Offset(1.0,1.0), // how much shadow will be shown
                ),
              ],
            ),
          ),
          ///listview of top orders
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                itemBuilder:(context , index){
                  return Container(
                    width: 150,
                    height: 100,
                    child:Image(
                      image: topOrders[index],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ///Best markets
          Text(
            'Best Markets',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              shadows: [
                Shadow(
                  blurRadius: 15,  // shadow blur
                  color: Colors.grey, // shadow color
                  offset: Offset(1.0,1.0), // how much shadow will be shown
                ),
              ],
            ),
          ),
          ///listview of best markets
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                itemBuilder:(context , index){
                  return Container(
                    width: 200,
                    height: 200,
                    child:Image(
                      image: bestMarkets[index],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
          ),
          ///btn navigation bar
        ],
      ),
    );
  }

}