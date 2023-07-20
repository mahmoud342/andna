import 'package:andna/about_us_body.dart';
import 'package:andna/forget_pass.dart';
import 'package:andna/product_details.dart';
import 'package:andna/profile_body.dart';
import 'package:andna/provider/cart.dart';
import 'package:andna/registration.dart';
import 'package:andna/shopping_cart_body.dart';
import 'package:andna/sign_up.dart';
import 'package:andna/splash_screen.dart';
import 'package:andna/store_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'all_orders.dart';
import 'c_panel.dart';
import 'delivery_man.dart';
import 'home_page.dart';

import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        ///return the class that contain the shared data .
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Registration.routeName: (context) => Registration(),
          SignUp.routeName: (context) => SignUp(),
          ForgetPass.routeName: (context) => ForgetPass(),
          SplashScreen.routeName: (context) => SplashScreen(),
          HomePage.routeName: (context) => HomePage(),
          StoreBody.routeName: (context) => StoreBody(),
          ProfileBody.routeName: (context) => ProfileBody(),
          AboutUsBody.routeName: (context) => AboutUsBody(),
          ShoppingCartBody.routeName: (context) =>ShoppingCartBody(),
          //ProductDetails.routeName:(context) => ProductDetails(),
          Cpanel.routeName: (context) => Cpanel(),
          ///this screen that the admin can see all delivery mans and there status.
          DeliveryMan.routeName: (context) => DeliveryMan(),
          ///this screen that the admin can see all orders of users.
          AllOrders.routeName: (context) => AllOrders(),

        },
        initialRoute: HomePage.routeName,
        theme: ThemeData.light(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
