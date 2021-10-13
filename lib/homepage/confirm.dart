import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your Payment Confirmation is Pending",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Circular Std",
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  minWidth: 330,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyStatefulWidget()));
                  },
                  color: kPrimaryColor,
                  child: Text('Go back to Home',
                      style: TextStyle(
                          fontFamily: "Circular STD",
                          color: Colors.white,
                          fontSize: 18)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
