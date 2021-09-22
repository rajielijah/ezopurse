import 'package:ezopurse/coin/buy_coin.dart';
import 'package:ezopurse/coin/sell_coin.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/widget/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Trade extends StatelessWidget {
  // const Trade({ Key? key }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0, top: 18),
              child: coin(
                  context,
                  Image.asset('images/me.png'),
                  Text(
                    'Bitcoin',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text('BTC'),
                  SvgPicture.asset('images/chart.svg'),
                  Text('\$2,309.43',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                  Text(
                    '+9.77%',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: TabBar(
                        //  indicator: Icon(Icons),
                        // isScrollable: true,
                        indicatorWeight: 0.01,

                        indicatorColor: kPrimaryColor,
                        tabs: [
                          Tab(
                            child: Container(
                              height: 40,
                              width: width / 2,
                              child: Center(
                                child: Text(
                                  'BUY',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.7,
                                      fontSize: 18),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height: 40,
                              width: width / 2,
                              child: Center(
                                child: Text(
                                  'SELL',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      letterSpacing: 0.7,
                                      fontSize: 18),
                                ),
                              ),
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                color: Colors.grey[200],
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            // FlatButton(
                            //     minWidth: 170,
                            //     height: 50,
                            //     onPressed: () {
                            //     },
                            //     shape: RoundedRectangleBorder(
                            //        side: BorderSide(
                            //       color: kPrimaryColor,
                            //       width: 1,
                            //       style: BorderStyle.solid),
                            // borderRadius: BorderRadius.circular(30)),
                            //     child: Text(
                            //       'SELL',
                            //       style: TextStyle(
                            //           // color: Colors.white,
                            //           letterSpacing: 0.7,
                            //           fontSize: 18),
                            //     ),
                            //     textColor: kPrimaryColor,
                            //     // color: kPrimaryColor,
                            //   ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 22,
                    ),
                    Expanded(
                        child: TabBarView(children: [BuyCoin(), SellCoin()]))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
