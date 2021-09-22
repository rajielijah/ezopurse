import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/model/core/forgot.dart';
import 'package:ezopurse/model/services/forget_password_api.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      onSaved: (value) => _email = value,
     decoration: InputDecoration(
     enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.grey[200])
    ),
    
  ),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

        var doforgotPassword = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            ForgotPasswordProvider().forgotPassword(_email);
        successfulMessage.then((response) {
          print(response);
          if (response['status'] == true) {
            // ForgotPasswordModel forgotPassword = response['user'];
            print(response['status']);
            print('let');
          } else {
            Flushbar(
              title: "Failed",
              message: 'Wrong Email Address',
              duration: Duration(seconds: 10),
            ).show(context);
            print('error!');
          }
        });
      } else {
        print("form is invalid");
      }
    };


     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: height/0.7,
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: Row(
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
                 ),
                  SizedBox(height: height/22,),
                  Text('Password retrieval link will be sent to your \n                        Email address', style: TextStyle(color: Colors.grey[400], fontSize: 15),),
                                     SizedBox(height: height/12,),
                  SvgPicture.asset('images/co.svg'),
                  SizedBox(height: height/10,),
                   Container(
                     color: Colors.white,
                     child: Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Enter Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                           Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(top:10),
                              child: Column(
                                children: [
                                  EmailField,
                                ],
                              ),
                            ),
                         ],
                       ),
                     ),
                   ),
                                      // SizedBox(height: height/32,),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Didn't get the email?", style: TextStyle(color: kPrimaryColor),)),
                    ),
                  // SizedBox(height: height/10,),                     
                     FlatButton(minWidth: 330, 
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                     onPressed: (){
                       doforgotPassword();
                     }, height: 50,
                      child: Text('Continue', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
                ],
            ),
          ),
        ),
      ),
    );
  }
}