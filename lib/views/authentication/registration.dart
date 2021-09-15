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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                color: Colors.white,
                child: Image.asset(
                  'images/logo1.png',
                  height: height / 1.5,
                  width: width,
                )),
            SizedBox(
              height: height / 15,
            ),
            Column(
              // // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  minWidth: 330,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  color: kPrimaryColor,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: height / 25,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignUp()));
                  },
                  height: 40,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: kPrimaryColor,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.white,
                  minWidth: 330,
                ),
              ],
            ),

            // Divider(thickness: 2,),
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
