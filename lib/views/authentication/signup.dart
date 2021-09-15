import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SignUp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
    enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.black)
    ),
    
  ),
    );

    final firstNameField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
   enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.black)
    ),
    
  ),
    );

    final lastNameField = TextFormField(
      autofocus: false,
       maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
    enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.black)
    ),
    
  ),);
    final phoneNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      validator: (value) =>
          value.isEmpty ? "Please enter a Valid Phone Number" : null,
    maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
   enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.black)
    ),
  ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
  maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
   enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.black)
    ),
    
  ),
    );

    final repeatPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
       maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
   enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.black)
    ),
    
  ),
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Create an account',
                        style: TextStyle(color: kPrimaryColor, fontSize: 15),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
               Container(
                 width: width,
                 color: Colors.white,
                 child: Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        Text('Email Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      
                    ),
                    padding: EdgeInsets.only(top:10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EmailField,
                       
                      ],
                    ),
                ),
                SizedBox(
                    height: height / 40,
                ),
                Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top:10),
                    child: Column(
                      children: [
                        firstNameField,
                       
                      ],
                    ),
                ),
                SizedBox(
                    height: height / 40,
                ),
                Text('Gender', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top:10),
                    child: Column(
                      children: [
                        lastNameField,
                       
                      ],
                    ),
                ),
                SizedBox(
                    height: height / 40,
                ),
                Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top:10),
                    child: Column(
                      children: [
                        phoneNumber,
                      
                      ],
                    ),
                ),
                SizedBox(
                    height: height / 40,
                ),
                Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top:10),
                    child: Column(
                      children: [
                        passwordField,
                      
                      ],
                    ),
                ),
                SizedBox(
                    height: height / 40,
                ),
                Text('Confirm Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top:10),
                    child: Column(
                      children: [
                        repeatPasswordField,
                        
                        
                      ],
                    ),
                ),
                     ],
                   ),
                 ),
               ),
                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: kPrimaryColor,
                      ),
                      Text(
                        'I accept Terms & Conditions',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  minWidth: 330,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Login()));
                  },
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: kPrimaryColor,
                ),
                // SizedBox(
                //   height: height/40,
                // ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Have an Account?',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          child: Text('Sign in'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Login()));
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
