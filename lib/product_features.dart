///this class created to be new data type of list that view the product list.
class ProductFeatures{
  String productImg;
  String productName;
  double productPrice;
  bool  newOldProduct;
  int starNum;
  ProductFeatures({required this.productImg , required this.productName , required this.productPrice, required this.newOldProduct , this.starNum=3});
}