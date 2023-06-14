import 'package:andna/tff_widget.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_theme.dart';

class DeliveryMan extends StatefulWidget {
  static const String routeName = 'delivery_man';

  @override
  State<DeliveryMan> createState() => _DeliveryManState();
}

class _DeliveryManState extends State<DeliveryMan> {
  List<String> items = [
    'Fast Food',
    'vegetables',
    'fruit',
    'grocery',
  ];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: [
              /// img andna
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                },
                child: Center(
                  child: Image.asset('assets/images/andna_logo_white.png'),
                ),
              ),
              ////////////////////////////////////////////////////////
              ///Delivery Man
              Text(
                'Delivery Man',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),

            ]),
      ),
    );
  }

}

