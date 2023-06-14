import 'package:andna/forget_pass.dart';
import 'package:andna/profile_body.dart';
import 'package:andna/registration.dart';
import 'package:andna/sign_up.dart';
import 'package:andna/splash_screen.dart';
import 'package:andna/store_body.dart';
import 'package:flutter/material.dart';

import 'all_orders.dart';
import 'c_panel.dart';
import 'delivery_man.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName :(context)=>SplashScreen(),
        HomePage.routeName :(context)=> HomePage(),
        Registration.routeName : (context)=> Registration(),
        ProfileBody.routeName :(context)=> ProfileBody(),
        StoreBody.routeName :(context)=> StoreBody(),
        SignUp.routeName :(context)=> SignUp(),
        ForgetPass.routeName : (context)=> ForgetPass(),
        Cpanel.routeName : (context)=> Cpanel(),
        DeliveryMan.routeName : (context)=>DeliveryMan(),
        AllOrders.routeName : (context)=> AllOrders(),
      },
      initialRoute: Cpanel.routeName,
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
    );
  }
}