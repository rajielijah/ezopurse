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
        
        body: SingleChildScrollView(
          child: Container(  
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/tall.png'))
            ),
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
                      // SizedBox(height:20),
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
                              top: 40,
                              child: 
                              SvgPicture.asset('images/s.svg', height: 50,)
                              // Image.asset('images/le.png', height: 100,)
                              ),
                            SvgPicture.asset('images/r.svg'),
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                   Container(
                  width: width,
                  height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                                child:   FlatButton(minWidth: 330, height: 50, 
                         shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30)
                               ),
                        onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegistrationPage()));
                            }, 
                            child: Text('Skip', style: TextStyle(color: Colors.white, fontSize: 18)), color: kPrimaryColor,),
                              ),
                ),
              )
                  // Padding(
                  //   padding: const EdgeInsets.all(19.0),
                  //   child: FlatButton(
                  //     minWidth: 330,
                  //     height: 40,
                  //      shape: RoundedRectangleBorder(
                  //        borderRadius: BorderRadius.circular(30)
                  //      ),
                  //     onPressed: (){
                  //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegistrationPage()));
                  //   }, 
                  //   child: Text('Skip', style: TextStyle(color: Colors.white),), color: kPrimaryColor,),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}