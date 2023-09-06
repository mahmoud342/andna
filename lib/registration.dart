import 'package:andna/sign_up.dart';
import 'package:flutter/material.dart';
import 'forget_pass.dart';
import 'home_page.dart';
import 'shared/my_theme.dart';

class Registration extends StatefulWidget {
  static const String routeName = 'registration';

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var userNameController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: [
          /// img andna
          Center(
            child: Image.asset('assets/images/andna_logo_white.png'),
          ),
          ////////////////////////////////////////////////////////
          Column(
            children: [
              ///Sign up
              Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ///user_name tff
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: userNameController,
                    decoration: const InputDecoration(
                        // filled: true,
                        // fillColor: Colors.white,
                        icon: Icon(Icons.person),
                        iconColor: Colors.grey,
                        hintText: 'Please, Enter your user name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                        labelText: 'User Name',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        )),
////////////////////////////////////////////////////////////////////////////////
                    ///value validation
                    validator: (String? value) {
                      setState(() {});
                      if (value == null || value == '') {}
                    },
                    onFieldSubmitted: (value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'please, complete the required field !!!',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {});
                      }
                    },
                    onChanged: (value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'please, complete the required field !!!',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
          ///////////////////////////////////////////////////////////////////
              ///pass tff
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: passController,
                    decoration: const InputDecoration(

                        // filled: true,
                        // fillColor: Colors.white,
                        icon: Icon(Icons.password),
                        iconColor: Colors.grey,
                        hintText: 'Please, Enter your password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        )),

                    ///value validation
                    validator: (String? value) {},
                    onFieldSubmitted: (value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'please, complete the required field !!!',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {});
                      }
                    },
                    onChanged: (value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'please, complete the required field !!!',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ///forget password
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(ForgetPass.routeName);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'forget password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
/////////////////////////////////////////////////////////////////
              ///sign in btn
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                  child: Text(
                      'Sign in',
                    style: TextStyle(
                      fontSize:20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          //////////////////////////Don\'t have an account? Create an account.///////////////////////////////
            ///Don\'t have an account? Create an account.
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Don\'t have an account?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed(SignUp.routeName);
                  },
                  child: Text(
                    'Create new account!    ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
        ]),
      ),
    );
  }
}
