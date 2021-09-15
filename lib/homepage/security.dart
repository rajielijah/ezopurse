import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  // const Security({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(child: Container(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text('Security', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
          ),
          Container(
            height: height/1.5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('images/check.png'),
                  SizedBox(height:height/7,),
                  Text('''Ezopurse secures all your transaction and this \nguarantees that all your Bitcoin transaction is based on a safe end-to-end dealings  with the Ezopurse team'''),
                 SizedBox(height: height/10,),
                  Text('You will be notified if there is an update')
                ],
              ),
            ),
          )
        ],
      ),),),
    );
  }
}