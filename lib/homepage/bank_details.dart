import 'package:ezopurse/coin/buy_coin.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/addbank.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';


class BankDetails extends StatelessWidget {
  // const BankDetails({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:15.0, top: 15, bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
                                    stops: [0.0, 0.1],
                                  ),
                                ),
                            height: MediaQuery.of(context).size.height / 4.5,
                                width: MediaQuery.of(context).size.width,
                        child:     Align(
                          alignment: Alignment.center,
                          child: ListTile(
                            title: Text('Bank Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            subtitle: Text('Select your preferred bank', style: TextStyle(color: Colors.white, letterSpacing: 0.7),),
                            trailing:   GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddBank()));
                            },
                            child: Container(
                              height: height / 17,
                              width: width / 4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19)),
                              child: Center(
                                  child: Text(
                                'Add bank',
                                style: TextStyle(color: kPColor[10]),
                              )),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ),
                    //  Positioned(
                    //       bottom: 20,
                    //       left: 10,
                    //       child: Image.asset('images/l.png')),
                        // Positioned(
                        //   left: 10,
                        //   bottom: 40,
                        //   child: Image.asset('images/ls.png',))
                  ],
                ),
                SizedBox(height: 40,),
                Container(
                  height: height/7,
                  decoration: BoxDecoration(
                    color: kPColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListTile(
                      title: Text('Zenith Bank', style: TextStyle(),),
                      subtitle: Text('5555 7777 8888 9999 0890', style: TextStyle(color: Colors.grey)),
                      trailing: Text('Visa',style: TextStyle(color: Colors.blue),
                    ),
                ),
                  ),
                ),
                 Container(
                   height: height/7,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(8)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: ListTile(
                       title: Text('First Bank', style: TextStyle(),),
                       subtitle: Text('5555 7777 8888 9999 0890', style: TextStyle(color: Colors.grey)),
                       trailing: Text('Visa',style: TextStyle(color: Colors.blue),
                     ),
                 ),
                   ),
                ),
               Container(
                  height: height/7,
                  decoration: BoxDecoration(
                    color: kPColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListTile(
                      title: Text('Zenith Bank', style: TextStyle(),),
                      subtitle: Text('5555 7777 8888 9999 0890', style: TextStyle(color: Colors.grey)),
                      trailing: Text('Mastercard',style: TextStyle(color: Colors.blue),
                    ),
                ),
                  ),
                ),
                 Container(
                   height: height/7,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(8)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: ListTile(
                       title: Text('First Bank', style: TextStyle(),),
                       subtitle: Text('5555 7777 8888 9999 0890', style: TextStyle(color: Colors.grey)),
                       trailing: Text('Visa',style: TextStyle(color: Colors.blue),
                     ),
                 ),
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