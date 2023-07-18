import 'package:andna/provider/cart.dart';
import 'package:andna/star_widget.dart';
import 'package:andna/product_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_theme.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = 'product_details';

  ///we should receive a complete product(obj carry product feature) in var is called receivedProduct of type ProductFeature.
  ProductFeatures receivedProduct;

  ///receivedProduct carry list() that is exist in store_body screen that contain obj carry product feature.
  ProductDetails({required this.receivedProduct});

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
          Center(
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
                        builder:((context , cart , child){
                          return  Text(
                            '${cart.selectedProducts.length}',
                              style: TextStyle(
                                color: MyTheme.mainColor,
                                fontSize: 10,
                              ),
                          );
                        })
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                'إم آند إمزهي قطع حلوى على شكل أزرار صغيرة، تنتجها شركة مارس، وسُميت بهذا الاسم لإنه الحروف الأولى من أسماء السيد فورست مارس من شركة مارس، والسيد بروس موري '
                'من شركة هيرشي للشيكولاتة، واللذان تعاونا في إنتاجها، وقطع الحلوى جميعها زينت بطباعة حرف إم صغير عليها وبداخلها أنواع مختلفة من الحشو، منها شيكولاتة الحليب، والشيكولاتة الغامقة، والكرسب، والشيكولاتة بالنعناع، وحبات اللوز،'
                ' والشيكولاتة بالبرتقال، وجوز الهند، وقطع بسكويت البريتزل، والكرز البري، والقرفة، وتوت العليق، وزبد الفول السوداني. وتقع شركة إم آند إمز في الولايات المتحدة وتباع الآن في حوالي 100 دولة حول العالم، ولها ألوان مختلفة',
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
          ],
        ),
      ),
    );
  }
}
