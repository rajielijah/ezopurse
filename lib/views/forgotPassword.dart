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
                    Text('Forgot Password?', style: TextStyle(color: kPrimaryColor),)
                  ],),
                  Text('Password retrieval link will be sent to your \n                        Email address'),
                   Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: EmailField,
                    ),
                    Text("Didn't get the email?", style: TextStyle(color: kPrimaryColor),),
                     FlatButton(minWidth: 330, onPressed: (){}, 
                      child: Text('Continue', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
                ],
            ),
          ),
        ),
      ),
    );
  }
}