import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:ezopurse/transaction/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceiveCoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: ,
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
                                Icons.arrow_back_ios
                              ))),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Receive Bitcoin',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: height/22,),
                  Container(
                    height: height ,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('images/me.png'),
                          Text(
                            'Scan the QR code to get Receive address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset('images/y.png'),
                          Divider(),
                          Text(
                            'Your Bitcoin Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "34HuwzDnSwxVRNCoySCpQnRBXV2vFFmBEE",
                              fillColor: Colors.white,
                              
                            ),
                          ),
                                
                          FlatButton(

                            
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Withdraw()));
                            },
                            height: 50,
                            child: Text(
                              'Copy Address',
                              style: TextStyle(fontSize: 18, letterSpacing: 0.7),
                            ),
                            textColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: kPrimaryColor,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.lightGreen[50],
                            minWidth: 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: height/22,),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      '* Block will be calculated after transaction \n         is generated and broadcasted',
                      style: TextStyle(),
                    ),
                  ),
                  // SizedBox(height: height/22,),
                  FlatButton(
                    minWidth: 330,
                    height: height / 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    },
                    child: Text(
                      'SHARE ADDRESS',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
