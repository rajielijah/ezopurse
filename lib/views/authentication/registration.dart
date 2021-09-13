import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:ezopurse/views/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RegistrationPage extends StatelessWidget {
  // const Registratioge({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container( 
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.white,
                  child: Image.asset('images/logo1.png', height: 320, width: width,)),
                FlatButton(minWidth: 330, height: 50, onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                }, 
                child: Text('Login', style: TextStyle(fontSize: 18),), color: kPrimaryColor, textColor: Colors.white,),
                FlatButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                }, 
                      height: 50,
                      child: Text('Sign Up', style: TextStyle(fontSize: 18),), textColor: kPrimaryColor, 
                      shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)), 
                      color: Colors.white, minWidth: 330,),
                Divider(thickness: 2,),
                // Container(
                //   width: width/1.09,
                //   color: Colors.white,
                //   child: FlatButton(minWidth: 330,onPressed: (){},  height: 50,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left:18.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         // SvgPicture.asset('images/apple.svg', height: height/15,),
                //        Image.asset('images/search.png', height: height/15,),
                //         SizedBox(width: width/20,),
                //         Text('Continue with Gmail', style: TextStyle(fontSize: 18),),
                //       ],
                //     ),
                //   ),
                //         shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)),
                //   ),
                // ),
                // Container(
                //   width: width/1.08,
                //   color: Colors.white,
                //   child: FlatButton(minWidth: 330,onPressed: (){}, height: 50, 
                //   child: Padding(
                //     padding: const EdgeInsets.only(left:18.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //          SvgPicture.asset('images/apple.svg', height: height/15,),
                //          SizedBox(width: width/20,),
                //         Text('Continue with Apple', style: TextStyle(fontSize: 18),),
                //       ],
                //     ),
                //   ),
                //         shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)),
                //   ),
                // ),
                ],
            ),           
      ),
    );
  }
}