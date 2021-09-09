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