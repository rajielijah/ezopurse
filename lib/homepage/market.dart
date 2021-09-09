import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/search.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Market extends StatelessWidget {
  // const Market({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Market is down ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      '- 11.17%',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    SizedBox(
                      width: width / 6,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Search()));
                        },
                        child: Icon(Icons.search))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('In the past 24 hours'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coins',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                            ),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Markets',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bitcoin - BTC',
                                            style:
                                                TextStyle(color: kPrimaryColor, fontSize: 17),
                                          ),
                                          SvgPicture.asset('images/group17.svg'),
                                                                               ],
                                      ),
                                       Divider(
                                            thickness: 1.4,
                                          ),
                                          Center(
                                            child: Text('No new market'),
                                          ),
                                          FlatButton(
                                            minWidth: 330,
                                            height: height/10,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Login()));
                                            },
                                            child: Text(
                                              'Update Market',
                                              style:
                                                  TextStyle(color: Colors.white, fontSize: 17),
                                            ),
                                            color: kPrimaryColor,
                                          ),

                                    ],
                                  ),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            //  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            primary: Colors.grey),
                        child: Row(
                          children: [
                            Text(
                              'Market-BTC',
                              style: TextStyle(),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}