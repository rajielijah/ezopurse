
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/bank_details.dart';
import 'package:ezopurse/homepage/notifications.dart';
import 'package:ezopurse/homepage/profile_details.dart';
import 'package:ezopurse/homepage/security.dart';
import 'package:ezopurse/homepage/terms.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:ezopurse/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  // const Profile({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( 
          child: Container(
            color: Colors.grey[100],
            // height: height,
            width: width,
            child: Column(
              children: [
                Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF5DD35D),
                                const Color(0xFF5DD35D)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              // stops: [0.0, 0.1],
                            ),
                          ),
                      height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           Stack(
                             alignment: Alignment.bottomRight,
                             children: [
                               CircleAvatar(
                                 backgroundColor: kPrimaryColor,
                                 child: Image.asset('images/ellips6.png'), radius: 40,),
                               Positioned(
                                //  top: 22,
                                 child: Icon(Icons.camera_alt_outlined, color: Colors.white,))
                             ],
                           ),
                           Text('Ben Tom', style: TextStyle(color: Colors.white, fontWeight:FontWeight.w500, fontSize: 20),),
                           Text('Bentom@gmail.com', style: TextStyle(color: Colors.white),),
                           Text('+2341 9977118', style: TextStyle(color: Colors.white,),)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      child: Image.asset('images/l.png')),
                    Positioned(
                      left: 10,
                      bottom: 70,
                      child: Image.asset('images/ls.png'))
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProfileDetails()));
                },
                child: profile(context, SvgPicture.asset('images/vector18.svg'), Text('Profile details', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp))),
              GestureDetector(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BankDetails()));
                },
                child: profile(context, SvgPicture.asset('images/vector17.svg'), Text('Bank details', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp))),
              GestureDetector(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Notifications()));
                },
                child: profile(context, SvgPicture.asset('images/vector15.svg'), Text('Notifications', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp))),
              GestureDetector(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Security()));
                },
                child: profile(context, SvgPicture.asset('images/vector16.svg'), Text('Security', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp))),
              // profile(context, SvgPicture.asset('images/vector14.svg'), Text('Help and Support', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),
              GestureDetector(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Terms()));
                },
                child: profile(context, SvgPicture.asset('images/Group.svg'), Text('Terms and Conditions', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp))),
               Padding(
    padding: const EdgeInsets.only(left:20.0, right: 20),
    child: GestureDetector(
      onTap: (){
       showAlertDialog(context);
      },
      child: ListTile(
        leading: SvgPicture.asset('images/or.svg'),
        title: Text('Logout', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),)),
    ),
  )
              ],
            ),
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget logoutButton = FlatButton(
    minWidth: 140,
    height: 60,
    color: kPrimaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: BorderSide(color: kPrimaryColor)
        ),
    child: Text("LOGOUT", style: TextStyle(color: Colors.white),),
    onPressed:  () {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
    },
  );
  Widget cancelButton = FlatButton(
     minWidth: 140,
    height: 60,
    
    shape: RoundedRectangleBorder(
       side: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(40)),
    child: Text("CANCEL", style: TextStyle(color: kPrimaryColor),),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // buttonPadding: EdgeInsets.all(20),
    title: Text("Confirm you want to log out", style: TextStyle(fontWeight: FontWeight.bold),),
    content: Text("Are you sure you want to sign out of your account", style: TextStyle(fontSize: 11),),
    actions: [
      logoutButton,
      cancelButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
}

 