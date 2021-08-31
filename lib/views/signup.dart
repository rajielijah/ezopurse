import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/views/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SignUp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Email",),
    );

    final firstNameField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("First Name",),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Last Name",),
    );
       final phoneNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      validator: (value) =>
          value.isEmpty ? "Please enter a Valid Phone Number" : null,
     decoration: buildInputDecoration("Phone Number",),
    );

      final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      decoration: buildInputDecoration("Password", ),
    );

     final repeatPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      decoration: buildInputDecoration("Repeat Password", ),
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
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
                  child: Icon(Icons.arrow_back, )),
                    SizedBox(width: 20,),
                    Text('Create an account', style: TextStyle(color: kPrimaryColor),)
                  ],
                ),
                
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: EmailField,
                ),
                 Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: firstNameField,
                ),
                 Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: lastNameField,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: phoneNumber,
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
                Row(
                  children: [
                    Icon(Icons.check_box, color: kPrimaryColor,),
                    Text('I accept Terms & Conditions', style: TextStyle(color: kPrimaryColor),),
                  ],
                ),
                   FlatButton(minWidth: 330, onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                  }, 
                  child: Text('Sign Up', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text('Have an Account?', style: TextStyle(color: kPrimaryColor),),
                    SizedBox(width: 10,),
                    GestureDetector(child: Text('Sign in'), onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                    })
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}