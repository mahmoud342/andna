import 'package:flutter/material.dart';

import 'my_theme.dart';

class TffWidget extends StatefulWidget {
  bool req = true;
  String label = '';
  String hint = '';
  TextInputType keyboardType ;
  var controller;
  var validator;

  TffWidget({required this.label , required this.hint , required this.keyboardType , required this.controller
  ,required this.validator , required this.req});

  @override
  State<TffWidget> createState() => _TffWidgetState();
}

class _TffWidgetState extends State<TffWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          decoration:  InputDecoration(
            hintText: widget.hint,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
              labelText: widget.label,
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
          ),
////////////////////////////////////////////////////////////////////////////////
          ///value validation
          // validator: (String? value) {
          //   if (value == null || value == '') {
          //     const snackBar = SnackBar(
          //       content: Text(
          //         'Please, Complete the required field!!!#######',
          //         style: TextStyle(
          //           color: MyTheme.mainColor,
          //           fontSize: 15,
          //         ),
          //       ),
          //       backgroundColor: Colors.white,
          //       duration: Duration(seconds: 5),
          //     );
          //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //   }
          // },
          onFieldSubmitted: (value) {
            if(widget.req==true)
              {
                if (value == null || value == '') {
                  const snackBar = SnackBar(
                    content: Text(
                      'please, complete the required field !!!-on field submitted-',
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
              }
          },
          onChanged: (value) {
            if(widget.req==true)
              {
                if (value == null || value == '') {
                  const snackBar = SnackBar(
                    content: Text(
                      'please, complete the required field !!!-on changed-',
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
              }
          },
        ),
      ),
    );
  }
}
