import 'package:ezopurse/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ForgotPassword extends StatelessWidget {
  // const ForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
     decoration: InputDecoration(
     enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.grey[200])
    ),
    
  ),
    );
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height/0.7,
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
                   onPressed: (){}, height: 50,
                    child: Text('Continue', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
              ],
          ),
        ),
      ),
    );
  }
}