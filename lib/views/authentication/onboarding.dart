import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/authentication/registration.dart';
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
          // decoration: BoxDecoration(
          //   image: DecorationImage(image: AssetImage('images/imageer.png'))
          // ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, )),
                    SizedBox(height:20),
                Container(
                  height: height/7,
                  width: width,
                  // color: Colors.white,
                  // decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Trade BTC conveniently', style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.7),),
                      Text('Buy and Sell Bitcoin with the \n           click of a button', style: TextStyle(letterSpacing: 0.7, fontSize: 15),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    height: height/2,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [

                            Positioned(
                            //  top: 30,
                            bottom: 120,
                             child: SvgPicture.asset('images/mock.svg', height: height/3,)),
                          SvgPicture.asset('images/ellipse16.svg', height: height,),
                           
                            Positioned(
                              // top: 10,
                              bottom: 70,
                              // left: 70,
                              right: 1,
                              child: SvgPicture.asset('images/group9.svg', height: height/10,)),
                            Positioned(
                              top: 10,
                              bottom: 140,
                              // left: 70,
                              right: 0,
                              child: SvgPicture.asset('images/group9.svg', height: height/10,)),
                              Positioned(
                              // top: 10,
                              bottom: 170,
                              // left: 70,
                              left: 1,
                              child: SvgPicture.asset('images/group9.svg', height: height/10,)),

                              Positioned(
                              // top: 10,
                              bottom: 70,
                              // left: 70,
                              left: 1,
                              child: SvgPicture.asset('images/group9.svg', height: height/10,)),
                        ],
                      ),
                    ),
                  ),
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
      ),
    );
  }
}