import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/widget/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingCoin extends StatelessWidget {
  // const TrendingCoin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
                  coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                 coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
            coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                 coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),)),
                coin(context,  Image.asset('images/me.png'), Text('Bitcoin', style: TextStyle(fontSize: 18),), Text('BTC'), SvgPicture.asset('images/chart.svg'), Text('#2,309.43'), Text('+9.77%', style: TextStyle(color: kPrimaryColor),))
          ],
        ),
        
      ),
    );
  }
}


class Favourite extends StatelessWidget {
  // const Favourite({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: height/35,),
          Text('Special place for Favorite coins', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: height/35,),
          Text('Add you favorite coins and check here easily ')
        ],
      ),
    );
  }
}