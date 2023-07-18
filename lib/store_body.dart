import 'package:andna/product_details.dart';
import 'package:andna/product_features.dart';
import 'package:andna/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'market_features.dart';
import 'my_theme.dart';

class StoreBody extends StatefulWidget {
  static const String routeName = 'store_body';

  @override
  State<StoreBody> createState() => _StoreBodyState();
}

class _StoreBodyState extends State<StoreBody> {
  /// list of top orders products
  List<ProductFeatures> products = [
    ProductFeatures(
        productImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU',
        productName: 'M&Ms',
        productPrice: 20.5,
      newOldProduct: true,
    ),
    ProductFeatures(
      productImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU',
      productName: 'M&Ms',
      productPrice: 9,
      newOldProduct: false,
    ),
    ProductFeatures(
      productImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU',
      productName: 'M&Ms',
      productPrice: 4,
      newOldProduct: true,
    ),
    ProductFeatures(
      productImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU',
      productName: 'M&Ms',
      productPrice: 29.5,
      newOldProduct: false,
    ),
    ProductFeatures(
      productImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlE9JVYFC9ESdhjU4ZH0yQ3vl7JaFgUaCjsA&usqp=CAU',
      productName: 'M&Ms',
      productPrice: 40,
      newOldProduct: true,
    ),
  ];

  /// list of best markets
  List<MarketFeature> markets = [
    MarketFeature(
      marketImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU',
      marketName: 'Fathala Market',
    ),
    MarketFeature(
      marketImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU',
      marketName: 'Fathala Market',
    ),
    MarketFeature(
      marketImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU',
      marketName: 'Fathala Market',
    ),
    MarketFeature(
      marketImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU',
      marketName: 'Fathala Market',
    ),
    MarketFeature(
      marketImagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo7VZUwuMHYQWrnS1UvBp2M4HsHDGTP-9Ww&usqp=CAU',
      marketName: 'Fathala Market',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                padding: EdgeInsetsDirectional.only(
                  start: 20,
                  end: 5,
                  bottom: 30,
                  top: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    ///circle avatar + welcome text + andna logo + total price
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///profile avatar////////////////////////////////////
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
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
                        Column(
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/andna_logo_white.png'),
                              size: 45,
                              color: Colors.white,
                            ),
                            ///total price
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Consumer<Cart>(
                                builder: ((context, cart, child){
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Total: ${cart.totalProductPrice} L.E',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 15, // shadow blur
                                              color: Colors.grey, // shadow color
                                              offset: Offset(1.0, 1.0), // how much shadow will be shown
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                ),
                              ),
                            ),
                          ],
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
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Search for any thing...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
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
            Container(
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Top Orders',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          blurRadius: 15, // shadow blur
                          color: Colors.grey, // shadow color
                          offset: Offset(1.0, 1.0), // how much shadow will be shown
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            ///listview of top orders
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 20,
              ),
              child: Container(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    ///clickable product
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                             MaterialPageRoute(builder: (context)=> ProductDetails(
                               receivedProduct: products[index],
                             ),
                             ),
                            ///if you do it via map via argument att.
                            /// arguments: will carry obj. from ProductFeature().//destination screen
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyTheme.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Image(
                              width: 100,
                              height: 100,
                              image: NetworkImage(
                                '${products[index].productImg}',
                              ),
                            ),

                            ///product name
                            Row(
                              children: [
                                Text(
                                  '${products[index].productName}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),

                            ///product price
                            Row(
                              children: [
                                Text(
                                  '${products[index].productPrice}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  ' L.E',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            ///add,minus btn
                            Row(
                              children: [
                                Consumer<Cart>(
                                  ///cart is obj of Cart class.
                                  builder: ((context , cart , child){
                                    return  FloatingActionButton.small(
                                      heroTag: '+',
                                      onPressed: () {
                                        ///products list is the list where you put the main products.
                                        cart.addProduct(products[index]);
                                      },
                                      child: Icon(Icons.add),
                                      backgroundColor: MyTheme.mainColor,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ),
            // //////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 20,
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
                    blurRadius: 15, // shadow blur
                    color: Colors.grey, // shadow color
                    offset: Offset(1.0, 1.0), // how much shadow will be shown
                  ),
                ],
              ),
            ),

            ///listview of best markets
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5,
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// market image
                        Image(
                          height: 100,
                          width: 200,
                          image: NetworkImage(
                            '${markets[index].marketImagePath}',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /// market name
                        Text(
                          '${markets[index].marketName}',
                          style: TextStyle(
                            fontSize: 20,
                            color: MyTheme.mainColor,
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: markets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
