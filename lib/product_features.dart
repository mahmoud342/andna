///this class created to be new data type of list that view the product list.
class ProductFeatures{
  String productImg;
  String productName;
  String productDetails;
  double productPrice;
  bool  newOldProduct;
  int starNum;
  ///the main job of this constructor is initialize each variable of specific index of products list by sending it in the constructor.
  ProductFeatures({required this.productImg , required this.productName ,
    required this.productPrice, required this.newOldProduct , this.starNum=3 , required this.productDetails});
}