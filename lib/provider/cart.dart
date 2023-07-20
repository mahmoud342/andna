import 'package:flutter/material.dart';

import '../product_features.dart';

///this class is created to contain a shared data between screens.
class Cart with ChangeNotifier{
  ///this data is the data we need to apply the change of it in any screen .
  List<ProductFeatures> selectedProducts=[];
  double totalProductPrice = 0;

  ///add product method
   addProduct(ProductFeatures selectedProduct){
     ///add product to new selected products list
    selectedProducts.add(selectedProduct);
    ///add product price to total price - ///selected product is sent from home page in click + btn
    totalProductPrice += selectedProduct.productPrice;
    ///listen the change and draw the screen again.
    notifyListeners();
    ///flag
    //print('${selectedProducts.length}');
  }

  ///remove product method (this fn wait -receive- a complete product)
  removeProduct(ProductFeatures selectedProduct){
    ///remove product to new selected products list
    selectedProducts.remove(selectedProduct);
    ///remove product price to total price - ///selected product is sent from home page in click - btn
    totalProductPrice -= selectedProduct.productPrice;
    ///listen the change and draw the screen again.
    notifyListeners();
    ///flag
    print('${selectedProducts.length}');
  }
}