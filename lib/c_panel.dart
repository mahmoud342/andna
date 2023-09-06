import 'package:andna/shared/tff_widget.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'all_orders.dart';
import 'home_page.dart';
import 'shared/my_theme.dart';
import 'package:file_picker/file_picker.dart';

class Cpanel extends StatefulWidget {
  static const String routeName = 'c_panel';

  @override
  State<Cpanel> createState() => _CpanelState();
}

class _CpanelState extends State<Cpanel> {
  List<String> items = [
    'Fast Food',
    'vegetables',
    'fruit',
    'grocery',
  ];
  String? selectedItem;
  var productNameController = TextEditingController();
  var productPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool tffEmpty = true;


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
          key: _formKey,
          child: Column(
              children: [
                /// img andna
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                  },
                  child: Center(
                    child: Image.asset('assets/images/andna_logo_white.png'),
                  ),
                ),
                ////////////////////////////////////////////////////////
                ///cpanel
                Text(
                  'C-panel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ///product img
                InkWell(
                  onTap: () async{
                    final result = await FilePicker.platform.pickFiles();
                    if(result == null)
                      {
                        return;
                      }
                    ///open single file
                    final file  = result.files.first;
                    openFile(file);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadiusDirectional.circular(5),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Add product images',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ///product name
                TffWidget(
                  req: true,
                  label: 'Product Name',
                  hint: 'Please, Enter product Name',
                  keyboardType: TextInputType.name,
                  controller: productNameController,
                  validator: (String? value) {
                      if(value == null || value =='')
                      {
                        tffEmpty =true;
                      }else
                      {
                        tffEmpty =false;
                      }
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                ///////////////////////////////////////////////////////////////////
                ///product price
                TffWidget(
                  req: true,
                  label: 'Product Price',
                  hint: 'Please, Enter product Price',
                  keyboardType: TextInputType.number,
                  controller: productPriceController,
                  validator: (String? value) {
                    if(value == null || value =='')
                      {
                        tffEmpty =true;
                      }else
                      {
                      tffEmpty =false;
                      }
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                /////////////////////////////////////////////////////////////////
                ///product category
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.pink,
                      width: 2,
                    ),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(
                      color: Colors.white,
                    ),
                    iconEnabledColor: Colors.pink,
                    hint: Text(
                      'Select category of product!',
                      style:TextStyle(
                      color: Colors.grey,
                    ),
                    ),
                    value: selectedItem,
                    items: items.map(
                        (item)=> DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                          ),

                        )
                    ).toList(),
                    onChanged: (valueSelected)=>setState(()=> selectedItem = valueSelected),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                /////////////////////////////////////////////////////////////////
                ///submit btn
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      //if(_formKey.currentState!.validate())
                      if(tffEmpty == false)
                        {
                          const snackBar = SnackBar(
                            content: Text(
                              'your product have been added successfully',
                              style: TextStyle(
                                color: MyTheme.mainColor,
                                fontSize: 15,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      else
                      {
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
                      }
                    },
                    child: Text(
                      'Submit',
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
                  height: 20,
                ),
                ///to all orders btn
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AllOrders.routeName);
                    },
                    child: Text(
                      'To all orders',
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
              ]),
        ),
      ),
    );
  }

  void openFile(PlatformFile file)
  {
     OpenFile.open(file.path!);
  }

}

