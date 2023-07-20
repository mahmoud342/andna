import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shopping_cart_body.dart';
import 'my_theme.dart';
import '../provider/cart.dart';

class ShoppingCartAndTotalPriceWidget extends StatelessWidget {
  bool isInDetailsScreen = true;

  ShoppingCartAndTotalPriceWidget({required this.isInDetailsScreen});

  @override
  Widget build(BuildContext context) {
    ///synchronized shopping cart
    return Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 10,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  if( isInDetailsScreen == true)
                  {
                    Navigator.of(context).pushNamed(ShoppingCartBody.routeName);

                  }
                  else{}
                },
                child: Stack(
                  children: [
                    ///shopping cart icon
                    Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 30,
                    ),

                    ///selected product items numbers
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                        ///consumer: listen to all changes that change in shared data file and rebuild the widget again.
                        child: Consumer<Cart>(
                          ///cart is obj of Cart class.
                            builder:(context , cart , child){
                              return  Text(
                                '${cart.selectedProducts.length}',
                                style: TextStyle(
                                  color: MyTheme.mainColor,
                                  fontSize: 10,
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                  ],
                ),
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
        ),
      );
  }
}
