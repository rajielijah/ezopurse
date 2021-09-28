import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:ezopurse/model/services/sned_btc.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

var provideris;

class SendCoin extends StatefulWidget {
  @override
  _SendCoinState createState() => _SendCoinState();
}

class _SendCoinState extends State<SendCoin> {
  final formKey = new GlobalKey<FormState>();

  String _address;
  String _amount;
  @override
  Widget build(BuildContext context) {
    var sendBTC = (BuildContext context, var provide) {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        Provider.of<SendProvider>(context, listen: false)
            .sendBtc(_address, _amount)
            .then((responseData) {
          print('responseData');
          if (responseData.isNotEmpty) {
            print('done');
            Flushbar(
              routeColor: kPrimaryColor,
              backgroundColor: kPrimaryColor,
              title: 'Initiated',
              message: " Transaction has been initiated, You will be notified when   it is completed,",
              duration: Duration(seconds: 15),
            ).show(context);
          } else {
            Flushbar(
              title: "Failed Login",
              message: responseData['message'].toString(),
              duration: Duration(seconds: 5),
            ).show(context);
            print('error!');
            provide.checkloginactivity(false);
          }
        });
      } else {
        Flushbar(
          title: "Form is Invalid",
          duration: Duration(seconds: 5),
        ).show(context);
        print('error!');
      }
    };

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => SendProvider())],
      child: Builder(builder: (context) {
        provideris = Provider.of<SendProvider>(context, listen: false);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Send Bitcoin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height / 29,
                        ),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: ListTile(
                            leading: Image.asset('images/me.png'),
                            title: Text(
                              'Bitcoin',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('BTC'),
                            trailing: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Available Balance',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    '2.23464 BTC',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 39,
                        ),
                        Container(
                          height: height / 1.6,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Enter Address',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  minLines: 1,
                                  onSaved: (value) => _address = value,
                                  decoration: InputDecoration(
                                    // focusedBorder: InputBorder.none,
                                    contentPadding: new EdgeInsets.symmetric(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.grey[200])),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black,
                                            style: BorderStyle.solid)),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                Text(
                                  'Amount',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  minLines: 1,
                                  onSaved: (value) => _amount = value,
                                  decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.grey[200])),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black,
                                            style: BorderStyle.solid)),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                Text(
                                  'Note',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.grey[200])),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.black,
                                            style: BorderStyle.solid)),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                Text('Transaction fees: 0.0006 BTC'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Min: 0.00061 BTC - Max: 2.0006 BTC')
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Center(
                            child: Text(
                              '* Block will be calculated after transaction \n         is generated and broadcasted',
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 22,
                        ),
                        FlatButton(
                          minWidth: width,
                          height: height / 15,
                           color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                             sendBTC(context, provideris);
                          },
                          child: Text(
                            'SEND BTC',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17),
                          ),
                         
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
