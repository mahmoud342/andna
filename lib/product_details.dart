import 'package:andna/home_page.dart';
import 'package:andna/provider/cart.dart';
import 'package:andna/shared/shopping_cat_&_total_price_widget.dart';
import 'package:andna/shared/star_widget.dart';
import 'package:andna/product_features.dart';
import 'package:andna/shopping_cart_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shared/my_theme.dart';

///this screen view the details of selected product.
class ProductDetails extends StatefulWidget {
  static const String routeName = 'product_details';

  ///we should receive a complete product(obj carry product feature) in var is called receivedProduct of type ProductFeature.
  ProductFeatures receivedProduct;
  int index;

  ///receivedProduct carry list() that is exist in store_body screen that contain obj carry product feature.
  ProductDetails({required this.receivedProduct , required this.index});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isShowMore = false;
  bool isNew = false;

  @override
  Widget build(BuildContext context) {
    ///receive args from store_body screen with customization to data class.if you send data in argument att.
    //var args = ModalRoute.of(context)?.settings.arguments as ProductFeatureArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.mainColor,
        title: Text(
          'Product Details',
        ),
        actions: [
          ///synchronized shopping cart
          ShoppingCartAndTotalPriceWidget(isInDetailsScreen: true),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ///product image
            Image(
              alignment: Alignment.center,
              image: NetworkImage(
                '${widget.receivedProduct.productImg}',
              ),
            ),

            ///product name
            Text(
              '${widget.receivedProduct.productName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: MyTheme.mainColor,
              ),
            ),

            ///price
            Text(
              ///reach by constructor
              '${widget.receivedProduct.productPrice} L.E',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: MyTheme.mainColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ///new + stars
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Row(
                children: [

                  ///new
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: MyTheme.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isNew ? 'NEW' : 'SALE',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  ///saters
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StarWidget(),
                        StarWidget(),
                        StarWidget(),
                        StarWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            ///details word
            Text(
              ' Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ///details
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '${widget.receivedProduct.productDetails}',
                maxLines: isShowMore ? 20 : 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            ///read more
            TextButton(
              onPressed: () {
                isShowMore = !isShowMore;
                setState(() {});
              },
              child: Text(
                isShowMore ? 'Show Less...' : 'Show More...',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ),

            Consumer<Cart>(
                builder: (context, cart, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: MaterialButton(
                        onPressed: (){
                          ///received product is a complete product with(name , price , details , ....) is sent by constructor to details screen.
                          cart.addProduct(widget.receivedProduct);
                        },
                      child: Text(
                        '+ Add to cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: MyTheme.mainColor,
                      textColor: Colors.white,
                    ),
                  );
                },
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
