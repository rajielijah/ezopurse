import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/registration.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  // const Onboarding({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                  height: 99,
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
                padding: const EdgeInsets.only(left:120.0),
                child: Image(image: AssetImage('images/changes.png'),),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
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