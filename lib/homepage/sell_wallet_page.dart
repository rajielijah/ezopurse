import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:ezopurse/homepage/sell_proof.dart';
import 'package:ezopurse/transaction/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceiveWalletAddress extends StatefulWidget {
  @override
  _ReceiveWalletAddressState createState() => _ReceiveWalletAddressState();
}

class _ReceiveWalletAddressState extends State<ReceiveWalletAddress> {
  TextEditingController _textController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _textController.text));
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _textController =
        TextEditingController(text: '34HuwzDnSwxVRNCoySCpQnRBXV2vFFmBEE');
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
                      Text(
                        'Sell Your BTC',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: "Circular Std"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height / 22,
                  ),
                  Container(
                    height: height / 3,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Image.asset('images/me.png'),
                          // SizedBox(height: height/20,),
                          // Text(
                          //   'Scan the QR code to get Receive address',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, letterSpacing: 0.7),
                          // ),

                          // SizedBox(height: height/25,),
                          // Image.asset('images/y.png'),
                          // SvgPicture.asset('images/V.png'),
                          // SizedBox(height: height/50,),
                          // Text('-or-'),
                          // SizedBox(height: height/25,),
                          Text(
                            'Send BTC to this Wallet Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: height / 25,
                          ),
                          TextFormField(
                            controller: _textController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "34HuwzDnSwxVRNCoySCpQnRBXV2vFFmBEE",
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: height / 25,
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                _copyToClipboard();
                              });
                            },
                            height: 50,
                            child: Text(
                              'Copy Address',
                              style:
                                  TextStyle(fontSize: 18, letterSpacing: 0.7),
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
                  SizedBox(
                    height: height / 22,
                  ),
                  FlatButton(
                    minWidth: width,
                    height: height / 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SellProof()));
                    },
                    child: Text(
                      'I HAVE TRANSFERED',
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
