import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/widget/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[100],
            // height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
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
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Welcome Ben',
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 0.7),
                          ),
                          Text(
                            'Start Investing now',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.7,
                                fontSize: 20),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Trade Now',
                              style: TextStyle(
                                  color: Colors.black, letterSpacing: 0.7),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                //  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                primary: Colors.grey[100]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Trending Coins',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold), 
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                coin(
                    context,
                    Image.asset('images/me.png'),
                    Text(
                      'Bitcoin',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('BTC'),
                    SvgPicture.asset('images/chart.svg'),
                    Text('\$2,309.43',style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
