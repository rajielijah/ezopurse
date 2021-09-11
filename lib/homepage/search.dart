import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/widget/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
 var width  = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold( 
        body: Container(
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height/12,
                      width: width/1.42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5) 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey[400],),
                            Text('Search Cryptocurrency', style: TextStyle(color: Colors.grey[400]),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.w500),))
                  ],
                ),
              ),
             coin(context, Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('\$2,309.43',  style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7),), Text('+9.77%', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}