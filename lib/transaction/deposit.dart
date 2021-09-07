import 'package:ezopurse/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Deposit extends StatelessWidget {
  // const Deposit({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEv,
            children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new)),
                SizedBox(width: 20,),
                Text('Deposit', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          Text('Enter Amount in BTC'),
          TextField(
            decoration:  InputDecoration(icon: Icon(Icons.done_all_sharp)),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
],
          ),
          Text('Min #100 - Max #10,00000'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: Mai,
            children: [
              Text('Current Balance: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text(' #10,000', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20), )
            ],
          )
            ],
          ),),
      ),
    );
  }
}