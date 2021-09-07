import 'package:ezopurse/coin/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget coin(BuildContext context, SvgPicture image, Text title, Text subtitle, SvgPicture chart,  Text price, Text percent){
   var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left:20.0, right: 20, bottom: 10),
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CoinPage()));
      },
      child: Container(
        height: height/7,
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white ),
        padding: EdgeInsets.all(10),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            image,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title, subtitle
              ],
            ),
            chart,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                price,
                percent
              ],
            )
          ],
        )
      ),
    ),
  );
}