import 'package:flutter/material.dart';
import 'home_page.dart';
import 'shared/my_theme.dart';

class AllOrders extends StatefulWidget {
  static const String routeName = 'AllOrders';

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
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
              ///All Orders
              Text(
                'All Orders',
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

