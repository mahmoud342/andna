import 'package:andna/home_page.dart';
import 'package:andna/provider/cart.dart';
import 'package:andna/shared/shopping_cat_&_total_price_widget.dart';
import 'package:andna/store_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/my_theme.dart';

///this is checkout screen.
class ShoppingCartBody extends StatefulWidget {
  static const String routeName = 'shopping_cart_body';

  @override
  State<ShoppingCartBody> createState() => _ShoppingCartBodyState();
}

class _ShoppingCartBodyState extends State<ShoppingCartBody> {
  //bool isCheckoutNotEmpty = false;

  @override
  Widget build(BuildContext context) {
    ///if you use provider.of you must put this line inside build method.
    //final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.mainColor,
        title: Text(
          'Checkout',
        ),
        actions: [
          /// this variable isInDetailsScreen put to prevent cat icon go to shopping cart in same screen
          ShoppingCartAndTotalPriceWidget(isInDetailsScreen: false),
        ],
      ),

      /// listView must be put in (SizedBox or Container) because there widgets have a height att.
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if(!cart.selectedProducts.isEmpty)
            {
              ///view 1///////////////////////////////
              return Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          ///item builder that be repeated.
                          return Container(
                            decoration: BoxDecoration(),
                            child: Card(
                              child: ListTile(
                                subtitle: Text(
                                    '${cart.selectedProducts[index].productPrice} L.E'),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(

                                    ///we have 2 lists (products list & selectedProducts List(main product list) in Cart(synchronized data file)).
                                    ///when user click add the all product(name , price , img) is added to (selectedProducts list).
                                    /// the product added with its feature(name,price,img) in selectedProducts list.
                                      '${cart.selectedProducts[index].productImg}'),
                                ),
                                title:
                                Text('${cart.selectedProducts[index].productName}'),
                                trailing: IconButton(
                                  onPressed: () {
                                    cart.removeProduct(cart.selectedProducts[index]);
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: cart.selectedProducts.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: MaterialButton(
                      padding: EdgeInsets.all(10),
                      onPressed: (){
                      },
                      child: Text(
                        'Checkout with Total Cost: ${cart.totalProductPrice} L.E',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: MyTheme.mainColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              );
            }else
              {
                ///view 2///////////////////////////////
                return Column
                  (
                  children: [
                    ///your shopping cart is empty
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your cart is Empty',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///empty cart icon
                    Container(
                      child: Image.asset('assets/images/empty_shopping_cart.jpg'),
                    ),
                    ///continue shopping btn
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.all(10),
                            onPressed: (){
                              Navigator.of(context).pushNamed(HomePage.routeName);
                            },
                            child: Text(
                              'Continue Shopping',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: MyTheme.mainColor,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
        },
      ),
      //      Column(
      //       children: [
      //         SingleChildScrollView(
      //           child: SizedBox(
      //             height: 500,
      //             child: ListView.builder(
      //               itemBuilder: (BuildContext context, int index) {
      //                 ///item builder that be repeated.
      //                 return Container(
      //                   decoration: BoxDecoration(),
      //                   child: Card(
      //                     child: ListTile(
      //                       subtitle: Text(
      //                           '${cart.selectedProducts[index].productPrice} L.E'),
      //                       leading: CircleAvatar(
      //                         backgroundImage: NetworkImage(
      //
      //                           ///we have 2 lists (products list & selectedProducts List(main product list) in Cart(synchronized data file)).
      //                           ///when user click add the all product(name , price , img) is added to (selectedProducts list).
      //                           /// the product added with its feature(name,price,img) in selectedProducts list.
      //                             '${cart.selectedProducts[index].productImg}'),
      //                       ),
      //                       title:
      //                       Text('${cart.selectedProducts[index].productName}'),
      //                       trailing: IconButton(
      //                         onPressed: () {
      //                           cart.removeProduct(cart.selectedProducts[index]);
      //                         },
      //                         icon: Icon(
      //                           Icons.remove,
      //                           color: Colors.red,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //               itemCount: cart.selectedProducts.length,
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 20,
      //           ),
      //           child: MaterialButton(
      //             padding: EdgeInsets.all(10),
      //             onPressed: (){
      //             },
      //             child: Text(
      //               'Checkout with Total Cost: ${cart.totalProductPrice} L.E',
      //               style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             color: MyTheme.mainColor,
      //             textColor: Colors.white,
      //           ),
      //         ),
      //       ],
      //     ),
      //
      //      Column(
      //   children: [
      //     ///your shopping cart is empty
      //     Container(
      //       decoration: BoxDecoration(
      //         color: Colors.red,
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Your cart is Empty',
      //             style: TextStyle(
      //               fontSize: 20,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     ///empty cart icon
      //     Container(
      //       child: Image.asset('assets/images/empty_shopping_cart.jpg'),
      //     ),
      //     ///continue shopping btn
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 20,
      //           ),
      //           child: MaterialButton(
      //             padding: EdgeInsets.all(10),
      //             onPressed: (){
      //               Navigator.of(context).pushNamed(StoreBody.routeName);
      //             },
      //             child: Text(
      //               'Continue Shopping',
      //               style: TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             color: MyTheme.mainColor,
      //             textColor: Colors.white,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
