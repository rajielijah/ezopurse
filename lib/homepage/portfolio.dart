import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:ezopurse/views/authentication/signup.dart';
import 'package:ezopurse/widget/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PortFolio extends StatelessWidget {
  // const PortFolio({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
       var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(
        child: Container(
           color: Colors.grey[100],
            height: height,
            width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF5DD35D),
                            const Color(0xFF5DD35D)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // stops: [0.0, 0.1],
                        ),
                      ),
                  height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('My portfolio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1, fontSize: 20),),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Holding value', style: TextStyle(color: Colors.white, fontSize: 12),),
                              SizedBox(height: height/90,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text('#2,704.78', style: TextStyle(color: Colors.white, fontSize: 27),), SizedBox(width: width/30,), Text('+9.88%', style: TextStyle(color: Colors.white),)],),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(left:20.0, right:20, bottom: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FlatButton(minWidth: 150, height: 50, onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                        }, 
                        child: Text('Deposit', style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontSize: 18),), color: kPrimaryColor
                        ,),
                        FlatButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                }, 
                      height: 50,
                      child: Text('Withdraw', style: TextStyle(fontSize: 18, letterSpacing: 0.7),), textColor: kPrimaryColor, 
                      shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)), 
                      color: Colors.white, minWidth: 150,),
           
                   ],
                 ),
               ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Your coin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              ),
               coin(context, SvgPicture.asset('images/logoo.svg'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
               coin(context, SvgPicture.asset('images/logoo.svg'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                
            ],
          ),
        ),
      ),)
    );
  }
}