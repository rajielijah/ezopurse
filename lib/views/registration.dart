import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/login.dart';
import 'package:ezopurse/views/signup.dart';
import 'package:flutter/material.dart';


class RegistrationPage extends StatelessWidget {
  // const Registratioge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(     
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('images/logo1.png', height: 340,),
                FlatButton(minWidth: 330, onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                }, 
                child: Text('Login'), color: kPrimaryColor,),
                FlatButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                }, 
                      child: Text('Sign Up'), textColor: kPrimaryColor, 
                      shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)), 
                      color: Colors.white, minWidth: 330,),
                Divider(thickness: 2,),
                FlatButton(minWidth: 330,onPressed: (){}, child: Text('Continue with Gmail'),
                      shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)),
                ),
                FlatButton(minWidth: 330,onPressed: (){}, child: Text('Continue with Apple'),
                      shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)),
                ),
                ],
            ),           
      ),
    );
  }
}