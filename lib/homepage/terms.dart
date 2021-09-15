import 'package:ezopurse/constant/color.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text('Terms and Conditions', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('Welcome to ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text('Ezopurse', style: TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Text('''Ezopurse secures all your transaction and this guarantees that all your Bitcoin transaction is based on a safe end-to-end dealings  Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, assumenda possimus quasi vero voluptates aliquid corporis velit architecto id? Harum, soluta beatae omnis esse facere vel molestias porro impedit ea.

Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, assumenda possimus quasi vero voluptates aliquid corporis velit architecto id? Harum, soluta beatae omnis esse facere vel molestias porro impedit ea.

Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, assumenda possimus quasi vero voluptates aliquid corporis velit architecto id? Harum, soluta beatae omnis esse facere vel molestias porro impedit ea. with the Ezopurse team '''),
                 SizedBox(height: 70,),
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