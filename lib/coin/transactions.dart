import 'package:ezopurse/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Transaction extends StatelessWidget {
  // const Transaction({ Key? key }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                            ))),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Transactions',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: height / 20,
                ),
                Container(
                  height: height / 6,
                  width: width / 1.17,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      // SvgPicture.asset('images/btc.svg'),
                      Image.asset('images/me.png'),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bitcoin', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),), Text('Amount: 5.485 BTC'), Text('Price: \$ 24.39 ')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Total:\$133.316', style: TextStyle(fontSize: 20,)), Text('27 May, 09:28 AM'), Text('Successfully Completed', style: TextStyle(color: kPrimaryColor),)
                        ],
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: height / 20,
                ),
                Container(
                  height: height / 6,
                  width: width / 1.17,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      // SvgPicture.asset('images/btc.svg'),
                      Image.asset('images/me.png'),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bitcoin', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),), Text('Amount: 5.485 BTC'), Text('Price: \$ 24.39 ')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Total:\$133.316', style: TextStyle(fontSize: 20,)), Text('27 May, 09:28 AM'), Text('Successfully Completed', style: TextStyle(color: kPrimaryColor),)
                        ],
                      )
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
