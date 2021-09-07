import 'package:ezopurse/coin/transactions.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/transaction/deposit.dart';
import 'package:ezopurse/transaction/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinPage extends StatelessWidget {
  // const CoinPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 var height = MediaQuery.of(context).size.height;
 var width  = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
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
                      child: Icon(Icons.arrow_back_ios_new)),
                    SizedBox(width: width/15,),
                    // SvgPicture.asset('images/btc.svg'),
                    Text('Bitcoin', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                    SizedBox(width: width/100,),
                    Text('(BTC)', style: TextStyle(),),
                    SizedBox(width: width/23,),
                    Icon(Icons.star_border_outlined),
                    SizedBox(width: width/6,),
                    SvgPicture.asset('images/Frame9.svg')
                  ],
              ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('#98,609.74  ', style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                      Text('+1700.254  (9,77%)', style: TextStyle(color: kPrimaryColor, fontSize: 18),)
                    ],
                  ),
                ),
                SvgPicture.asset('images/group45.svg'),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    // color: Colors.amber,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                    child: ListTile(leading:SvgPicture.asset('images/btc.svg'), title: Text('Bitcoin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), subtitle: Text('00.00 BTC'), trailing: Text('#00.00', style: TextStyle(fontSize: 18),))),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Transaction()));
                    },
                    child: Container(
                      // color: Colors.amber,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                      child: ListTile(title: Text('Transactions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), trailing: Icon(Icons.arrow_forward_ios_outlined),)),
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.only(left:20.0, right:20, bottom: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FlatButton(minWidth: 150, height: 50, onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Deposit()));
                        }, 
                        child: Text('BUY', style: TextStyle(color: Colors.white, letterSpacing: 0.7, fontSize: 18),), color: kPrimaryColor
                        ,),
                        FlatButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Withdraw()));
                }, 
                      height: 50,
                      child: Text('SELL', style: TextStyle(fontSize: 18, letterSpacing: 0.7),), textColor: Colors.white, 
                      shape: RoundedRectangleBorder(side: BorderSide(color: kPrimaryColor,width: 1, style: BorderStyle.solid),borderRadius: BorderRadius.circular(5)), 
                      color: Colors.blue[900], minWidth: 150,),
           
                   ],
                 ),
               ),
              ],
            ),
          ),
         ),
      ),
    );
  }
}