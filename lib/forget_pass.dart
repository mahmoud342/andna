import 'package:andna/registration.dart';
import 'package:andna/tff_widget.dart';
import 'package:flutter/material.dart';
import 'my_theme.dart';

class ForgetPass extends StatefulWidget {
  static const String routeName = 'forget_pass';

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {

  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();
  var confirmNewPassController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey1,
          child: Column(
              children: [
                /// img andna
                Center(
                  child: Image.asset('assets/images/andna_logo_white.png'),
                ),
                ////////////////////////////////////////////////////////
                Text(
                  'Reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
///////////////////////////////////////////////////////////////////
                ///old pass tff
                TffWidget(
                  label: 'old password',
                  hint: 'Please, Enter your old password' ,
                  keyboardType: TextInputType.visiblePassword,
                  controller: oldPassController,
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
                ///new pass tff
                TffWidget(
                  label: 'new password',
                  hint: 'Please, Enter the new password' ,
                  keyboardType: TextInputType.visiblePassword,
                  controller: newPassController,
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

                ///renter new pass tff
                TffWidget(
                  label: 'Re-enter new password',
                  hint: 'Please, Re-enter the new password' ,
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmNewPassController,
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
                  height: 30,
                ),
/////////////////////////////////////////////////////////////////
                ///Confirm btn
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey1.currentState!.validate())
                      {
                        Navigator.of(context).pushReplacementNamed(Registration.routeName);
                      }
                      else
                      {
                        return;
                        // const snackBar = SnackBar(
                        //   content: Text(
                        //     'please, complete the required field !!!',
                        //     style: TextStyle(
                        //       color: MyTheme.mainColor,
                        //       fontSize: 15,
                        //     ),
                        //   ),
                        //   backgroundColor: Colors.white,
                        //   duration: Duration(seconds: 5),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      'Confirm',
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
              ]
          ),
        ),
      ),
    );
  }
}

