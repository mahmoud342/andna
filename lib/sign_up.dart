import 'package:andna/registration.dart';
import 'package:andna/shared/tff_widget.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'shared/my_theme.dart';

class SignUp extends StatefulWidget {
  static const String routeName = 'sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
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
                  ///Sign UP
                  Text(
                    'Sign UP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  ///tff first name
                  TffWidget(
                    req: true,
                    label: 'First Name',
                    hint: 'Please, Enter the first name.',
                    keyboardType: TextInputType.text,
                    controller: firstNameController,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please, Complete the required field!!!#######',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///tff last name
                  TffWidget(
                    req: true,
                    label: 'Last Name',
                    hint: 'Please, Enter the Last name.',
                    keyboardType: TextInputType.text,
                    controller: lastNameController,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please, Complete the required field!!!#######',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///tff email
                  TffWidget(
                    req: true,
                    label: 'email',
                    hint: 'Please, Enter your email.',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please, Complete the required field!!!#######',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///tff user name
                  TffWidget(
                    req: true,
                    label: 'user name',
                    hint: 'Please, Enter the user name.',
                    keyboardType: TextInputType.name,
                    controller: userNameController,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please, Complete the required field!!!#######',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///tff phone
                  TffWidget(
                    req: true,
                    label: 'phone number',
                    hint: 'Please, Enter your phone number.',
                    keyboardType: TextInputType.name,
                    controller: phoneController,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please, Complete the required field!!!#######',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ///tff pass
                  TffWidget(
                    req: true,
                    label: 'password',
                    hint: 'Please, Enter the password.',
                    keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                    validator: (String? value) {
                      if (value == null || value == '') {
                        const snackBar = SnackBar(
                          content: Text(
                            'Please, Complete the required field!!!#######',
                            style: TextStyle(
                              color: MyTheme.mainColor,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),

                  ///sign up btn
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if(firstNameController.toString().isNotEmpty && lastNameController.toString().isNotEmpty
                        && emailController.toString().isNotEmpty && userNameController.toString().isNotEmpty
                        && passController.toString().isNotEmpty)
                          {
                            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                          }
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
                      },
                      child: Text(
                        'Sign UP',
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

              //////////////////////////already have an account? Sign in!.///////////////////////////////
              /// already have an account? Sign in!.
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'already have an account?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed(Registration.routeName);
                    },
                    child: Text(
                      'Sign in!    ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}