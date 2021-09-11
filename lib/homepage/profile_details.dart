import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/bank_details.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ProfileDetails extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Email",),
    );

    final fullNameField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Full Name",),
    );

    final genderField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Gender",),
    );
       final dobNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      // validator: (value) =>
      //     value.isEmpty ? "Please enter a Valid Phone Number" : null,
     decoration: buildInputDecoration("D.O.B",),
    );

      final countryField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Country",),
    );

      final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      decoration: buildInputDecoration("Password", ),
    );

     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, ))),
                      SizedBox(width: 20,),
                      Text('Profile details', style: TextStyle(color: kPrimaryColor,  fontWeight: FontWeight.bold, fontSize: 23),)
                    ],
                  ),
                  SizedBox(
                    height: height/10,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: EmailField,
                  ),
                   SizedBox(
                    height: height/40,
                  ),
                   Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: fullNameField,
                  ),
SizedBox(
                    height: height/40,
                  ),
                  
                   Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: genderField,
                  ),
                  SizedBox(
                    height: height/40,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: dobNumber,
                  ),
                  SizedBox(
                    height: height/40,
                  ),
                   Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: countryField,
                  ),
                  SizedBox(
                    height: height/40,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: passwordField,
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   padding: EdgeInsets.all(10),
                  //   child: repeatPasswordField,
                  // ),
                  // SizedBox(height: 20,),
                   SizedBox(
                    height: height/10,
                  ),
                     FlatButton(minWidth: 330, height: 50, onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                    }, 
                    child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20),), color: kPrimaryColor,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //   Text('Have an Account?', style: TextStyle(color: kPrimaryColor),),
                    //   SizedBox(width: 10,),
                    //   GestureDetector(child: Text('Sign in'), onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                    //   })
                    // ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}