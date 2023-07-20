import 'package:andna/shared/my_theme.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState()
  {
    super.initState();
    _navigateFromSplash();
  }

  _navigateFromSplash()async{
    await Future.delayed(
        Duration( milliseconds: 4000), (){}
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///andna logo
          Center(
            child: Container(
              child: Image.asset('assets/images/logo_andna.png'),
            ),
          ),
          ///andna slogan
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              padding: EdgeInsets.all(3),
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyTheme.mainColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20),
                  bottomStart: Radius.circular(20),
                ),
              ),
              child: Text(
                  '... اللى عندنا مش عند حد ...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,

                  fontFamily: 'ReemKufi',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}