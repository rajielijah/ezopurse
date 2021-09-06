import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  // const Onboarding({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 90,
                  width: 343,
                  color: Colors.white,
                  // decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Trade BTC conveniently', style: TextStyle(color: kPrimaryColor, fontSize: 20),),
                      Text('Buy and Sell Bitcoin with the \n           click of a button')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Center(child: SvgPicture.asset('images/group.svg', height: height/2,)),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: FlatButton(
                  minWidth: 330,
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegistrationPage()));
                }, 
                child: Text('Skip', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
              )
            ],
          ),
        ),
      ),
    );
  }
}