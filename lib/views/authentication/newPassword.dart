import 'package:ezopurse/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:ezopurse/constant/textfield.dart';


class ChangePassword extends StatelessWidget {
  // const ForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, )),
                    SizedBox(width: 10,),
                    Text('Create new password', style: TextStyle(color: kPrimaryColor),)
                  ],),
                  Text('Your new password must be different\n        from the forgotten password'),
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
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      repeatPasswordField,
                      Padding(
                        padding: const EdgeInsets.only(left:20.0, right:20),
                        child: Divider(color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                    
                     FlatButton(minWidth: 330, onPressed: (){}, 
                      child: Text('Save', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
                ],
            ),
          ),
        ),
      ),
    );
  }
}