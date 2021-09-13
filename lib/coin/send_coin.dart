import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendCoin extends StatelessWidget {
  // const SendCoin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: Icon(Icons.arrow_back_ios))),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Send Bitcoin',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: height/29,),
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
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height/39,
                  ),
                  Container(
                    height: height / 1.5,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Enter Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          Text(
                            'Amount',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          Text(
                            'Note',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          Text('Transaction fees: 0.0006 BTC'),
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
                  SizedBox(height: height/22,),
                  FlatButton(
                    minWidth: width,
                    height: height / 15,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    },
                    child: Text(
                      'SEND BTC',
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
