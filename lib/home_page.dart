import 'package:andna/profile_body.dart';
import 'package:andna/shopping_cart_body.dart';
import 'package:andna/store_body.dart';
import 'package:flutter/material.dart';
import 'about_us_body.dart';
import 'my_theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String selectedProductsNumber = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///body
      body: bodies[selectedIndex],

      ///BNB wrapped with Theme Widget because we want to change canvas color value in BNB only.
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          //canvasColor: MyTheme.lightPrimary,
          //canvasColor: Theme.of(context).primaryColor,
          canvasColor: MyTheme.mainColor,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.red,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,

          ///static index = 0
          currentIndex: selectedIndex,

          ///dynamic index...
          onTap: (index) {
            /// selected index will be updated from here.
            selectedIndex = index;
            setState(() {});
          },
          /////////////////////////////////items of Bottom navigation Bar////////////////////////////////////////
          ///items of Bottom navigation Bar.
          items:  [
            ///icon_profile
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
              ),
              label: 'Profile',
            ),

            ///icon_products
            BottomNavigationBarItem(
              icon: Icon(
                Icons.storefront,
              ),
              label: 'Store',
            ),

            ///icon_andna
            BottomNavigationBarItem(
              icon: Container(
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ImageIcon(
                  AssetImage('assets/images/logo_andna.png'),
                ),
              ),
              label: 'about Us',
            ),

            ///icon_cart
            BottomNavigationBarItem(
              icon:Icon(
                Icons.add_shopping_cart_outlined,
              ),
              label: 'cart $selectedProductsNumber',
            ),
          ],
        ),
      ),
    );
  }

  ///create list of bodies
  List<Widget> bodies = [
    ProfileBody(),
    StoreBody(),
    AboutUsBody(),
    ShoppingCartBody(),
  ];
}
