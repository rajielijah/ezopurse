import 'package:ezopurse/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:ezopurse/constant/textfield.dart';


class ForgotPassword extends StatelessWidget {
  // const ForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration("Email",),
    );
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Text('Forgot Password?', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17),)
                  ],),
                  SizedBox(height: height/12,),
                  Text('Password retrieval link will be sent to your \n                        Email address', style: TextStyle(color: Colors.grey[400], fontSize: 15),),
                                     SizedBox(height: height/12,),
                   Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left:10),
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
                                      SizedBox(height: height/32,),
                    Padding(
                      padding: const EdgeInsets.only(bottom:18.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Didn't get the email?", style: TextStyle(color: kPrimaryColor),)),
                    ),
                  SizedBox(height: height/3,),                     
                     FlatButton(minWidth: 330, onPressed: (){}, height: 50,
                      child: Text('Continue', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
                ],
            ),
          ),
        ),
      ),
    );
  }
}