import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/views/authentication/forgotPassword.dart';
import 'package:ezopurse/views/authentication/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // const Loginin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final EmailField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Email",),
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
                resizeToAvoidBottomInset: false,
        body: Container(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, )), 
                SizedBox(width: 10,),
                Text('Let me sign you in', style: TextStyle(color: kPrimaryColor, fontSize: 18),)
              ],),
              Container(
                height: 220,
                width: 343,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Image(image: AssetImage('images/61.png'),),
              ),
               Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      EmailField,
                      Padding(
                        padding: const EdgeInsets.only(left:20.0, right:20),
                        child: Divider(color: Colors.black),
                      )
                    ],
                  ),
                ),
                  Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      passwordField,
                      Padding(
                        padding: const EdgeInsets.only(left:20.0, right:20),
                        child: Divider(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
                      },
                      child: Text('Forget Password?', style: TextStyle(color: kPrimaryColor),)),
                      SizedBox(width: width/20,),
                    Text("Don't Have an account?", style: TextStyle(color: kPrimaryColor),),
                    SizedBox(width: width/100,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                      },
                      child: Text('Sign Up'),
                    )
                  ],),
                ),
              FlatButton(minWidth: 330, height: 50, onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyStatefulWidget()));
                  }, 
                  child: Text('Login', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
            ],),
          ),      
        ),
      ),
    );
  }
}