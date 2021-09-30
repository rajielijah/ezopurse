import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/model/core/user_model.dart';
import 'package:ezopurse/model/core/wallet_state_model.dart';
import 'package:ezopurse/model/services/get_user.dart';
import 'package:ezopurse/model/services/wallet_state_api.dart';
import 'package:ezopurse/widget/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

var clientName;
var clientBalance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<ProfileModel> user;
  Future<WalletStateModel> walletState;

  @override
  void initState() {
    user = UserApi.instance.getUser();
    walletState = WalletStateApi.instance.getWalletState();
    super.initState();
  }

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
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                        height: MediaQuery.of(context).size.height / 4.2,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              clientName != null
                                  ? Text(
                                      'Welcome $clientName',
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 0.7),
                                    )
                                  : FutureBuilder<ProfileModel>(
                                      future: user,
                                      builder: (context, snapshot) {
                                        clientName =
                                            snapshot.data.data.firstName;
                                        if(snapshot.data.data.firstName != null){
                                        return Text(
                                          'Welcome ${snapshot.data.data.firstName}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              letterSpacing: 0.7),
                                        );
                                        }
                                        else{
                                          return Text('');
                                        }
                                      }),
                              Text(
                                'BTC Value',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$2,509.75',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.7,
                                        fontSize: 26),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '+9.77%',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Available Bal.',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              clientBalance != null
                                  ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                        '\$$clientBalance',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                  )
                                  : FutureBuilder<WalletStateModel>(
                                      future: walletState,
                                      builder: (context, snapshot) {
                                        
                                        if(snapshot.data != null){
                                        return Column(
                                          children: [
                                            ListView.builder(
                                               shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: snapshot.data.result.length,
                                                itemBuilder: (context, index){
                                                  clientBalance = snapshot.data.result[index].balanceAmount;
                                              return Align(
                                                alignment: Alignment.bottomRight,
                                                child: Text(
                                                  "\$$clientBalance",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              );
                                                }),
                                          ],
                                        );}
                                        else{
                                          return Text('');
                                        }
                                      })
                            ],
                          ),
                        ),
                      ),
                      //  Positioned(
                      // bottom: 20,
                      // left: 10,
                      // child: Image.asset('images/l.png')),
                      Positioned(
                          left: 10,
                          top: 50,
                          child: Image.asset('images/ls.png'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Your BTC',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
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
                    Text('\$2,309.43',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 0.7)),
                    Text(
                      '+9.77%',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, top: 15),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/me.png',
                              height: 30,
                            ),
                            SizedBox(
                              width: width / 45,
                            ),
                            Text(
                              'Bitcoin',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: width / 100,
                            ),
                            Text(
                              '(BTC)',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$98,609.74  ',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '+1700.254  (9.77%)',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset('images/group45.svg'),
                      SizedBox(
                        height: height / 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width / 8,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: kPrimaryColor)),
                              child: Center(
                                  child: Text(
                                '1 H',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              width: width / 8,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.grey[400])),
                              child: Center(child: Text('24 H')),
                            ),
                            Container(
                              width: width / 8,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.grey[400])),
                              child: Center(child: Text('1 W')),
                            ),
                            Container(
                              width: width / 8,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.grey[400])),
                              child: Center(child: Text('1 M')),
                            ),
                            Container(
                              width: width / 8,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.grey[400])),
                              child: Center(child: Text('6 M')),
                            ),
                            Container(
                              width: width / 8,
                              height: height / 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: Colors.grey[400])),
                              child: Center(child: Text('1 Y')),
                            )
                          ],
                        ),
                      ),
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
