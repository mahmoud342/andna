import 'package:andna/profile_editing_screen.dart';
import 'package:andna/shared/profile_menu_widget.dart';
import 'package:flutter/material.dart';
import 'shared/my_theme.dart';

class ProfileBody extends StatefulWidget {
  static const String routeName = 'profile_body';

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  bool isEditIconClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              ///circle avatar profile photo + Edit icon
              Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    'assets/images/profile.png',
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 15,
                  child: Container(
                    padding:EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              ),
              SizedBox(
                height: 20,
              ),
              ///full name(icon + name)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: MyTheme.mainColor,
                    Icons.account_circle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                      'Ahmed abdulla',
                    style: TextStyle(

                      fontSize: 20,
                      color: MyTheme.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ///Email(icon + Email)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: MyTheme.mainColor,
                    Icons.email_rounded,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ahmedabdulla@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      color: MyTheme.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ///Edit profile btn
              ElevatedButton(
                ///specific way to change color of elevated btn.
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                  onPressed: (){
                  Navigator.of(context).pushNamed(ProfileEditingScreen.routeName);
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              ///menu
              Column(
                children: [
                  ///settings
                  ProfileMenuWidget(
                    menuIcon: Icons.settings_outlined,
                    menuTitle: 'Settings',
                  ),
                  ///logout
                  ProfileMenuWidget(
                      menuTitle: 'Logout',
                      menuIcon: Icons.exit_to_app_rounded
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}